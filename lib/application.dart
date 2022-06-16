import 'package:notes/config.dart';
import 'package:notes/core/utils/util_log.dart';

class Application {
  static Future<void> init() async {
    await Log.init();
    await AppConfig.init();
  }
}
