import 'package:flutter/material.dart';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

import 'package:notes/core/widgets/widget_refresh.dart';
import 'package:notes/core/widgets/widget_tab_bar.dart';
import 'package:notes/core/widgets/widget_button.dart';

class DemoNestedPage extends StatefulWidget {
  const DemoNestedPage({Key? key}) : super(key: key);

  @override
  _DemoNestedPageState createState() => _DemoNestedPageState();
}

class _DemoNestedPageState extends State<DemoNestedPage>
    with SingleTickerProviderStateMixin {
  List<String> _tabs = [];

  late TabController _tabController;

  final _key = GlobalKey<ExtendedNestedScrollViewState>();

  @override
  void initState() {
    super.initState();
    _tabs = ['关注', '推荐', '热榜', '视频', '圈子'];
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ExtendedNestedScrollView(
          key: _key,
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
            return statusBarHeight;
          },
          body: TabBarView(
            controller: _tabController,
            children: List<Widget>.generate(
              _tabs.length,
              (index) {
                return _ListViewPage();
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          _key.currentState?.outerController.animateTo(
            0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
          );
        },
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
            Icons.menu,
            color: Colors.blue,
            size: 22.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
            child: const Icon(
              Icons.add_a_photo,
              color: Colors.blue,
              size: 22.0,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 2.0,
      ),
    );
  }

  Widget _buildTabHeader() {
    return SliverToBoxAdapter(
      child: ScaleTabBar(
          controller: _tabController,
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
            _tabs.length,
            (index) {
              return Tab(
                text: _tabs[index],
              );
              // return Text('index');
            },
          )),
    );
  }
}

class _ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<_ListViewPage>
    with AutomaticKeepAliveClientMixin {
  // List<SimpleHomeModel> itemList = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadHomeData();
    });
  }

  Future<void> _loadHomeData() async {
    // String jsonData =
    //     await rootBundle.loadString('assets/json/simple_home.json');
    // List jsonResult = json.decode(jsonData);
    // itemList = jsonResult.map((e) {
    //   return SimpleHomeModel.fromJson(e as Map<String, dynamic>);
    // }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Refresh(
      onRefresh: () async {},
      onLoad: () async {},
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (content, index) {
              return _SimpleHomeItem();
            },
            childCount: 10,
          ),
        )
      ],
    );
  }
}

class _SimpleHomeItem extends StatelessWidget {
  // final SimpleHomeModel model;

  // _SimpleHomeItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '标题',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: ClipOval(
                  // child: Image.network(
                  //   'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1603365312,3218205429&fm=26&gp=0.jpg',
                  //   fit: BoxFit.fill,
                  // ),
                  child: Image.asset(
                    '',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                '作者',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '摘要',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '110 赞同 · 200 评论',
                  style: TextStyle(
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
                  child: Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: Colors.black45,
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    minimumSize: MaterialStateProperty.all(Size(1, 1)),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
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
