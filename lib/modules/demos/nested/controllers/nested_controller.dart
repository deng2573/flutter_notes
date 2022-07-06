import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

import 'package:notes/core/widgets/widget_refresh.dart';
import 'package:notes/modules/demos/nested/models/nested_model.dart';

class NestedController extends GetxController with GetTickerProviderStateMixin {
  final dataList = <NestedData>[];

  final tabs = <String>[].obs;

  late TabController tabController;

  final nestedkey = GlobalKey<ExtendedNestedScrollViewState>();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onReady() async {
    super.onReady();
    await _loadData();
  }

  Future<void> _loadData() async {
    final data = await rootBundle.loadString('assets/json/nested.json');
    final result = json.decode(data) as List<dynamic>;
    dataList.addAll(result.map((e) => NestedData.fromJson(e)).toList());
    final tabList = dataList.map((e) => e.name ?? '').toList();
    tabController = TabController(length: tabList.length, vsync: this);
    tabs.value = tabList;
  }

  void refreshData() async {
    dataList.clear();
    await _loadData();
  }

  void jumpTop() {
    nestedkey.currentState?.outerController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}

class NestedListController extends GetxController {
  NestedListController({
    required this.id,
  });

  final int id;
  final items = <NestedModel>[].obs;
  final refreshController = RefreshController();

  final nestedController = Get.find<NestedController>();

  int _page = 0;

  @override
  void onReady() async {
    super.onReady();
    await onRefresh();
  }

  Future<void> onRefresh() async {
    await _reload(true);
  }

  Future<void> onLoad() async {
    await _reload(false);
  }

  Future<void> _reload(bool reload) async {
    reload ? _page = 0 : _page++;
    final data = await _loadData();
    if (reload) {
      items.clear();
    }
    items.addAll(data);
    refreshController.refreshFinish(noMore: data.length < 10);
  }

  Future<List<NestedModel>> _loadData() async {
    final data = nestedController.dataList
        .firstWhere((element) => element.id == id)
        .list;
    return data ?? [];
  }

  @override
  void onClose() {
    super.onClose();
    refreshController.dispose();
  }
}
