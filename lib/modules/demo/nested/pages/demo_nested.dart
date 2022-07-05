import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:notes/core/widgets/widget_image.dart';

import 'package:notes/core/widgets/widget_refresh.dart';
import 'package:notes/core/widgets/widget_tab_bar.dart';
import 'package:notes/core/widgets/widget_button.dart';

import 'package:notes/modules/demo/nested/models/nested_model.dart';
import 'package:notes/modules/demo/nested/controllers/nested_controller.dart';

class DemoNestedPage extends GetView<NestedController> {
  const DemoNestedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NestedController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ExtendedNestedScrollView(
          key: controller.nestedkey,
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return <Widget>[
              _buildSliverAppBar(),
              _buildTabHeader(),
            ];
          },
          pinnedHeaderSliverHeightBuilder: () {
            return MediaQuery.of(context).padding.top;
          },
          body: Obx(() {
            return TabBarView(
              controller: controller.tabController,
              children: List<Widget>.generate(
                controller.tabs.length,
                (index) {
                  final id = controller.dataList[index].id;
                  return NestedListView(id: id ?? 0);
                },
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: controller.jumpTop,
        child: const Icon(
          Icons.arrow_upward,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverAppBar(
        expandedHeight: 56,
        backgroundColor: Colors.white,
        leadingWidth: 28,
        automaticallyImplyLeading: true,
        leading: ScaleTap(
          child: const Icon(
            Icons.add_a_photo,
            color: Colors.blue,
            size: 22.0,
          ),
          onPressed: () {},
        ),
        titleSpacing: 18,
        title: Material(
          shape: const StadiumBorder(),
          color: Colors.grey.withOpacity(0.25),
          child: Container(
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Icon(
                  Icons.search,
                  color: Colors.black26,
                  size: 20.0,
                ),
                Text(
                  '搜索或输入网址',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black38, fontSize: 15),
                ),
                Icon(
                  Icons.mic,
                  color: Colors.black26,
                  size: 20.0,
                ),
              ],
            ),
          ),
        ),
        actions: [
          ScaleTap(
            onPressed: controller.refreshData,
            child: const Icon(
              Icons.refresh_sharp,
              color: Colors.blue,
              size: 22.0,
            ),
          ),
        ],
        elevation: 2.0,
      ),
    );
  }

  Widget _buildTabHeader() {
    return SliverToBoxAdapter(
      child: Obx(
        () {
          return ScaleTabBar(
            controller: controller.tabController,
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            isScrollable: false,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            tabs: List<Widget>.generate(
              controller.tabs.length,
              (index) {
                return Tab(
                  text: controller.tabs[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class NestedListView extends GetView<NestedListController> {
  const NestedListView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  String? get tag => '$id';

  @override
  Widget build(BuildContext context) {
    Get.put(NestedListController(id: id), tag: '$id');
    return Refresh.child(
      onRefresh: () async {},
      onLoad: () async {},
      child: Obx(() {
        return ListView.builder(
          itemBuilder: (context, index) {
            final item = controller.items[index];
            return _buildItem(item);
          },
          itemCount: controller.items.length,
        );
      }),
    );
    // return Refresh.slivers(
    //   onRefresh: () async {},
    //   onLoad: () async {},
    //   slivers: [
    //     Obx(() {
    //       return SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           (content, index) {
    //             final item = controller.items[index];
    //             return _buildItem(item);
    //           },
    //           childCount: controller.items.length,
    //         ),
    //       );
    //     }),
    //     Obx(() {
    //       return SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           (content, index) {
    //             final item = controller.items[index];
    //             return _buildItem(item);
    //           },
    //           childCount: controller.items.length,
    //         ),
    //       );
    //     })
    //   ],
    // );
  }

  Widget _buildItem(NestedModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.title ?? '',
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: ClipOval(
                  child: CacheImage.url(
                    item.avatar ?? '',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                item.name ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.content ?? '',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 7),
          if (item.cover != null)
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CacheImage.url(
                item.cover ?? '',
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '${item.likeCount ?? 0} 赞同 · ${item.commentCount ?? 0} 评论',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    minimumSize: MaterialStateProperty.all(Size.zero),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
