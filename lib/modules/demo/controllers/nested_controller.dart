import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

import 'package:notes/modules/home/models/home_model.dart';
import 'package:notes/routes/paths.dart';

class NestedController extends GetxController with GetTickerProviderStateMixin {
  final tabs = <String>[].obs;

  late TabController tabController;

  final nestedkey = GlobalKey<ExtendedNestedScrollViewState>();

  @override
  void onInit() {
    super.onInit();
    tabs.value = ['关注', '推荐', '热榜'];
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onReady() async {
    super.onInit();
  }

  void updateTabs() {
    final tabs = ['关注', '推荐', '热榜', '视频', '圈子'];
    tabController = TabController(length: tabs.length, vsync: this);
    this.tabs.value = tabs;
  }

  void jumpTop() {
    nestedkey.currentState?.outerController.animateTo(
      0.0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }
}

class NestedListController extends GetxController {
  final items = <HomeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }
}
