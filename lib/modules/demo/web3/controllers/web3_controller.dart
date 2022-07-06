import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:notes/modules/demo/web3/models/web3_model.dart';

class DemoWeb3Controller extends GetxController {
  final recommendList = <RecommendModel>[].obs;
  final rankingList = <RankingModel>[].obs;
  final marketList = <MarketModel>[].obs;

  @override
  void onReady() async {
    super.onReady();
    await _loadData();
  }

  Future<void> _loadData() async {
    final data = await rootBundle.loadString('assets/json/web3.json');
    final result = json.decode(data) as Map<String, dynamic>;

    ///解析推荐列表
    final recommend = result['recommend'] as List<dynamic>;
    recommendList.clear();
    recommendList
        .addAll(recommend.map((e) => RecommendModel.fromJson(e)).toList());

    ///解析排行榜
    final ranking = result['ranking'] as List<dynamic>;
    rankingList.clear();
    rankingList.addAll(ranking.map((e) => RankingModel.fromJson(e)).toList());

    ///解析咸鱼市场
    final market = result['market'] as List<dynamic>;
    marketList.clear();
    marketList.addAll(market.map((e) => MarketModel.fromJson(e)).toList());
  }

  Future<void> toRecommendPage() async {}
  Future<void> toRankingPage() async {}
  Future<void> toMarketPage() async {}
}
