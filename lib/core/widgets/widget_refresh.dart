import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easy_refresh/easy_refresh.dart';

class Refresh extends StatelessWidget {
  final RefreshController? controller;
  final FutureOr Function()? onRefresh;
  final FutureOr Function()? onLoad;
  final Widget? child;
  final List<Widget>? slivers;

  const Refresh.child({
    Key? key,
    this.controller,
    this.onRefresh,
    this.onLoad,
    required this.child,
  })  : slivers = null,
        super(key: key);

  const Refresh.slivers({
    Key? key,
    this.controller,
    this.onRefresh,
    this.onLoad,
    required this.slivers,
  })  : child = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return child != null
        ? EasyRefresh(
            controller: controller,
            onRefresh: onRefresh,
            onLoad: onLoad,
            child: child,
          )
        : EasyRefresh.builder(
            controller: controller,
            onRefresh: onRefresh,
            onLoad: onLoad,
            childBuilder: (context, physics) {
              return CustomScrollView(
                physics: physics,
                slivers: slivers ?? [],
              );
            },
          );
  }
}

class RefreshController extends EasyRefreshController {
  void refreshFinish({
    bool noMore = false,
  }) {
    finishRefresh(
      noMore ? IndicatorResult.succeeded : IndicatorResult.noMore,
    );
  }

  void loadFinish({
    bool noMore = false,
  }) {
    finishLoad(
      noMore ? IndicatorResult.succeeded : IndicatorResult.noMore,
    );
  }
}
