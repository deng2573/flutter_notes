import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:notes/modules/home/models/home_model.dart';
import 'package:notes/routes/paths.dart';

class HomeController extends GetxController {
  final items = <HomeModel>[].obs;

  @override
  void onReady() async {
    super.onInit();
    await _loadItems();
  }

  Future<void> _loadItems() async {
    final data = await rootBundle.loadString('assets/json/home.json');
    final result = json.decode(data) as List<dynamic>;
    items.value = result.map((e) => HomeModel.fromJson(e)).toList();
  }

  void openSamplePage(HomeModel item) {
    Get.toNamed(Paths.sample, arguments: item.id);
  }
}
