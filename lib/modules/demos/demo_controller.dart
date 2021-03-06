import 'package:get/get.dart';
import 'package:notes/routes/paths.dart';

class DemoController extends GetxController {
  Future<void> openDemo(int id) async {
    switch (id) {
      case 0:
        Get.toNamed(Paths.demoNested);
        break;
      case 1:
        Get.toNamed(Paths.demoWeb3);
        break;
      case 2:
        Get.toNamed(Paths.demoChat);
        break;
    }
  }
}
