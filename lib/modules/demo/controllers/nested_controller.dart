import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

import 'package:notes/modules/home/models/home_model.dart';
import 'package:notes/routes/paths.dart';

class NestedController extends GetxController {
  final List<String> _tabs = <String>[].obs;

  late TabController _tabController;

  final _nestedViewkey = GlobalKey<ExtendedNestedScrollViewState>();

  @override
  void onReady() async {
    super.onInit();
    await _loadItems();
  }

  Future<void> _loadItems() async {
    final data = await rootBundle.loadString('assets/json/home.json');
    final result = json.decode(data) as List<dynamic>;
    // items.value = result.map((e) => HomeModel.fromJson(e)).toList();
  }

  void openSimplePage(HomeModel item) {
    Get.toNamed(Paths.simple, arguments: item.id);
  }
}
