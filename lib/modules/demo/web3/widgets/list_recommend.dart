import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'package:notes/core/widgets/widget_image.dart';
import 'package:notes/core/widgets/widget_button.dart';
import 'package:notes/modules/demo/web3/controllers/web3_controller.dart';
import 'package:notes/modules/demo/web3/models/web3_model.dart';

class RecommendListView extends GetView<DemoWeb3Controller> {
  const RecommendListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 175.0,
        child: Obx(
          () {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final model = controller.recommendList[index];
                return RecommendListItem(
                  model: model,
                  onTap: controller.toRecommendPage,
                );
              },
              itemCount: controller.recommendList.length,
            );
          },
        ),
      ),
    );
  }
}

class RecommendListItem extends StatelessWidget {
  final RecommendModel model;
  final VoidCallback? onTap;

  const RecommendListItem({
    Key? key,
    required this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: onTap,
      child: Card(
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: 120,
          child: Column(
            children: [
              Expanded(
                child: _buildImage(),
              ),
              _buildName(),
              const SizedBox(height: 5),
              _buildPrice(),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      fit: StackFit.expand,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: CacheImage.url(
            model.cover ?? '',
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.heart_solid,
                  color: Colors.red,
                  size: 12,
                ),
                Text(
                  '${model.likeCount ?? 0}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: CacheImage.url(
            model.avatar ?? '',
            width: 30,
            height: 30,
            shape: BoxShape.circle,
            fit: BoxFit.cover,
            border: Border.all(
              color: Colors.white30,
              width: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          model.name ?? '',
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 2),
        const Icon(
          Icons.check_circle,
          color: Colors.red,
          size: 10,
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¥${model.price ?? 0}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
