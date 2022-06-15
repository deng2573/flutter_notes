import 'dart:io';
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../net/network_exceptions.dart';

late final Logger logger;

File? get loggerFile => _loggerFile;
File? _loggerFile;

Future<void> initLogger() async {
  String? _loggerPath;
  if (Platform.isIOS) {
    final dir = await getApplicationDocumentsDirectory();
    _loggerPath = dir.path;
  } else if (Platform.isAndroid) {
    final dir = await getExternalStorageDirectory();
    _loggerPath = dir?.path;
  }

  const _appEnv = String.fromEnvironment('APP_ENV', defaultValue: 'local');
  if ((_appEnv == 'prod' || _appEnv == 'stage') && _loggerPath != null) {
    _loggerFile = File('$_loggerPath/lie.log');
    if (!_loggerFile!.existsSync()) {
      _loggerFile?.createSync();
    }
    logger = Logger(
      printer: PrefixPrinter(PrettyPrinter(colors: false)),
      output: FileOutput(file: _loggerFile!, overrideExisting: true),
      level: Level.error,
      filter: ProductionFilter(),
    );
  } else {
    logger = Logger(
      printer: PrettyPrinter(),
    );
  }
}

class FileOutput extends LogOutput {
  final File file;
  final bool overrideExisting;
  final Encoding encoding;
  IOSink? _sink;

  FileOutput({
    required this.file,
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  @override
  void init() {
    _sink = file.openWrite(
      mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
      encoding: encoding,
    );
  }

  @override
  void output(OutputEvent event) {
    _sink?.writeAll(event.lines, '\n');
  }

  @override
  void destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}

Future<bool> liePrintError(
  Object e,
  StackTrace stack, {
  bool showError = true,
  bool dismiss = true,
}) async {
  final error = NetworkExceptions.getDioException(e);
  if (showError) {
    if (error is BusinessError) {
      EasyLoading.showError(error.message);
      return true;
    }
  }
  logger.e(e.toString(), e, stack);
  if (dismiss) {
    EasyLoading.dismiss();
  }
  return false;
}
