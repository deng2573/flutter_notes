import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class Log {
  static late final File file;

  static late final Logger _logger;

  static Future<void> init() async {
    if (kDebugMode || kIsWeb) {
      _logger = Logger(
        printer: PrettyPrinter(),
      );
    } else {
      Directory? logDirectory;
      if (Platform.isAndroid) {
        logDirectory = await getExternalStorageDirectory();
      }
      logDirectory ??= await getApplicationDocumentsDirectory();
      file = File('${logDirectory.path}/notes.log');
      _logger = Logger(
        printer: PrettyPrinter(),
        output: FileOutput(file: file),
        level: Level.error,
        filter: ProductionFilter(),
      );
    }
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }
}

class FileOutput extends LogOutput {
  final File file;
  IOSink? _sink;

  FileOutput({
    required this.file,
  });

  @override
  void init() {
    _sink = file.openWrite(mode: FileMode.append);
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
