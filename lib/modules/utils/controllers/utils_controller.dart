import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notes/core/utils/util_hud.dart';
import 'package:notes/core/utils/util_log.dart';
import 'package:notes/core/utils/util_input.dart';

class UtilsController extends GetxController {
  Future<void> openUtils(int id) async {
    switch (id) {
      case 0:
        HUD.loading();
        await Future.delayed(const Duration(seconds: 1));
        HUD.dismiss();
        break;
      case 1:
        HUD.toast(msg: '加载成功');
        break;
      case 2:
        HUD.dialog(const Text('加载成功'));
        break;
      case 3:
        HUD.alter();
        break;
      case 4:
        Input.show(
          context: Get.context!,
          hintText: '请输入',
        );
        break;
      case 5:
        Log.i('verbose1');
        Log.d('verbose1');
        Log.w('verbose1');
        Log.e('error1');
        break;
    }
  }
}
