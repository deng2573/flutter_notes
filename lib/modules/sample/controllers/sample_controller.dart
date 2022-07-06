import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:notes/modules/demos/demo_controller.dart';
import 'package:notes/modules/utils/controllers/utils_controller.dart';

import 'package:notes/modules/sample/models/sample_model.dart';

class SampleController extends GetxController {
  late final int id;

  final items = <SampleModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments as int;
  }

  @override
  void onReady() async {
    super.onReady();
    await _loadItems();
  }

  Future<void> _loadItems() async {
    final data = await rootBundle.loadString('assets/json/sample.json');
    final result = json.decode(data) as List<dynamic>;
    final list = result.map((e) => SampleData.fromJson(e)).toList();
    items.value = list.firstWhere((e) => e.id == id).samples ?? [];
  }

  void openSamplePage(SampleModel item) {
    switch (id) {
      case 0:
        final c = Get.put(UtilsController());
        c.openUtils(item.id);
        break;
      case 2:
        final c = Get.put(DemoController());
        c.openDemo(item.id);
        break;
    }
  }
}
