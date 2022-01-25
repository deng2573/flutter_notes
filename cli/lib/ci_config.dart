import 'dart:io';

import 'package:yaml/yaml.dart';

class Config {
  static final project = Directory.current.path;

  static String get version => _version;
  static late String _version;

  static String get buildNumber => _buildNumber;
  static late String _buildNumber;

  static String get appName => _appName;
  static late String _appName;

  static init() async {
    final yamlFile = File('$project/pubspec.yaml');
    final yamlStr = await yamlFile.readAsString();
    final yamlDoc = loadYaml(yamlStr);
    final yamlName = yamlDoc['name'].toString();
    final yamlVersion = yamlDoc['version'].toString();
    _version = yamlVersion.split('+').first;
    _buildNumber = yamlVersion.split('+').last;
    _appName = '${yamlName}_v$version.${buildNumber}_develop';
  }
}
