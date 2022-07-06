import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:notes/core/widgets/widget_button.dart';
import 'package:notes/modules/demo/web3/widgets/list_header.dart';
import 'package:notes/modules/demo/web3/widgets/list_market.dart';
import 'package:notes/modules/demo/web3/widgets/list_ranking.dart';
import 'package:notes/modules/demo/web3/widgets/list_recommend.dart';

import 'package:notes/modules/demo/web3/controllers/web3_controller.dart';

class DemoWeb3Page extends GetView<DemoWeb3Controller> {
  const DemoWeb3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DemoWeb3Controller());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: const SafeArea(
          child: CustomScrollView(
        slivers: [
          Web3ListHeader(title: '青睐之光', content: '今日'),
          RecommendListView(),
          Web3ListHeader(title: '热力排行', content: '今日'),
          RankingListView(),
          Web3ListHeader(title: '闲鱼市场', content: '最新上架'),
          MarketGridView(),
        ],
      )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leadingWidth: 28,
      automaticallyImplyLeading: true,
      elevation: 3,
      centerTitle: false,
      backgroundColor: Colors.white,
      leading: ScaleTap(
        child: const Icon(
          Icons.view_comfortable,
          color: Colors.blue,
          size: 30.0,
        ),
        onPressed: () {},
      ),
      titleSpacing: 5,
      title: const Text(
        '茫洋',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 20,
        ),
      ),
    );
  }
}
