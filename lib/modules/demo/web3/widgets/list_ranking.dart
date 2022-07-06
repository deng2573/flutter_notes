import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:notes/core/widgets/widget_button.dart';
import 'package:notes/core/widgets/widget_image.dart';
import 'package:notes/modules/demo/web3/controllers/web3_controller.dart';
import 'package:notes/modules/demo/web3/models/web3_model.dart';

class RankingListView extends GetView<DemoWeb3Controller> {
  const RankingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (content, index) {
            final model = controller.rankingList[index];
            return RankingListItem(
              model: model,
              onTap: controller.toRankingPage,
            );
          },
          childCount: controller.rankingList.length,
        ),
      );
    });
  }
}

class RankingListItem extends StatelessWidget {
  final RankingModel model;
  final VoidCallback? onTap;

  const RankingListItem({
    Key? key,
    required this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: onTap,
      child: Card(
        elevation: 0.2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              _buildSerial(),
              const SizedBox(width: 5),
              _buildAvatar(),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(),
                    const SizedBox(height: 5),
                    _buildPrice(),
                  ],
                ),
              ),
              Column(
                children: [
                  _buildRatio(),
                  const SizedBox(height: 5),
                  _buildAmount(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSerial() {
    return Text(
      '${model.num}',
      style: TextStyle(
        fontSize: 14,
        color: Colors.black.withOpacity(0.7),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildAvatar() {
    return CacheImage.url(
      model.avatar ?? '',
      width: 40,
      height: 40,
      shape: BoxShape.circle,
      fit: BoxFit.cover,
      border: Border.all(
        color: Colors.white10,
        width: 2,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      model.name ?? '',
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildPrice() {
    return Text(
      '¥${model.price}',
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildRatio() {
    return Text(
      '+${model.ratio}%',
      style: const TextStyle(
        fontSize: 13,
        color: Colors.red,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildAmount() {
    return Text(
      '量${model.count}',
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black87,
      ),
    );
  }
}
