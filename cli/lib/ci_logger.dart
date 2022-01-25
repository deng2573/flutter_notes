import 'package:logger/logger.dart';

final logger = Logger(
  filter: ProductionFilter(),
  printer: PrettyPrinter(methodCount: 0),
);
