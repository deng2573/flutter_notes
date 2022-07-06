import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:notes/core/widgets/widget_button.dart';
import 'package:notes/core/widgets/widget_image.dart';
import 'package:notes/modules/demo/web3/controllers/web3_controller.dart';
import 'package:notes/modules/demo/web3/models/web3_model.dart';

class MarketGridView extends GetView<DemoWeb3Controller> {
  const MarketGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            final model = controller.marketList[index];
            return MarketGridtem(
              model: model,
              onTap: controller.toMarketPage,
            );
          },
          childCount: controller.marketList.length,
        ),
      );
    });
  }
}

class MarketGridtem extends StatelessWidget {
  final MarketModel model;
  final VoidCallback? onTap;

  const MarketGridtem({
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _buildImage(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 5),
                  _buildPrice(),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return CacheImage.url(
      model.cover ?? '',
    );
  }

  Widget _buildTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${model.name}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '编号：${model.number ?? ''}',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black38,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '¥${model.price}',
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        ScaleTap(
          onPressed: onTap,
          child: Container(
            alignment: Alignment.topCenter,
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              color: Colors.blueAccent,
            ),
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
            child: const Center(
              child: Text(
                '购买',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
