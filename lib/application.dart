import 'package:notes/core/config/config.dart';
import 'package:notes/core/utils/util_log.dart';

class Application {
  static Future<void> init() async {
    await Log.init();
    await AppConfig.init();
  }
}
