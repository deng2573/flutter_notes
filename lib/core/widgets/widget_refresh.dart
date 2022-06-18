import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class Refresh extends StatelessWidget {
  final EasyRefreshController? controller;
  final OnRefreshCallback? onRefresh;
  final OnLoadCallback? onLoad;
  final List<Widget> slivers;

  const Refresh({
    Key? key,
    this.controller,
    this.onRefresh,
    this.onLoad,
    required this.slivers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      controller: controller,
      onRefresh: onRefresh,
      onLoad: onLoad,
      slivers: slivers,
    );
  }
}

class RefreshController extends EasyRefreshController {
  void refreshSucess({
    bool noMore = false,
  }) {
    finishRefresh(success: true, noMore: noMore);
  }

  void loadSuccess({
    bool noMore = false,
  }) {
    finishLoad(success: true, noMore: noMore);
  }
}
