// import 'dart:convert';

// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart'
//     hide NestedScrollView, NestedScrollViewState;

// // import 'package:yl_flutter_notes/utils/hud.dart';
// // import 'package:yl_flutter_notes/widgets/tab_bar.dart';
// // import 'package:yl_flutter_notes/widgets/circle_point.dart';
// // import 'package:yl_flutter_notes/widgets/sliver_header.dart';
// // import 'package:yl_flutter_notes/modules/basics/simple/models/simple.dart';
// import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';


// class SimpleHomePage extends StatefulWidget {
//   SimpleHomePage();

//   @override
//   _SimpleHomePageState createState() => _SimpleHomePageState();
// }

// class _SimpleHomePageState extends State<SimpleHomePage>
//     with SingleTickerProviderStateMixin {
//   List<String> _tabs;

//   TabController _tabController;

//   double _appBarOpacity = 1;

//   final GlobalKey<NestedScrollViewState> _nestedScrollKey =
//       GlobalKey<NestedScrollViewState>();

//   @override
//   void initState() {
//     super.initState();
//     _tabs = ['关注', '推荐', '热榜', '视频', '圈子'];
//     _tabController = TabController(length: _tabs.length, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double statusBarHeight = MediaQuery.of(context).padding.top;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: NotificationListener(
//           onNotification: (ScrollNotification notification) {
//             // notification.depth 监听的对象
//             // depth == 0 是 NestedScrollView
//             // depth == 2 是 ListView
//             if (notification.depth == 0) {
//               // notification.metrics.pixels 滑动偏移量
//               // print(notification.metrics.pixels);
//               // 根据偏移量修改AppBar透明度
//               double opacity = 1 - (notification.metrics.pixels / 40);
//               if (_appBarOpacity != opacity && opacity <= 1 && opacity >= 0) {
//                 setState(() {
//                   _appBarOpacity = opacity;
//                 });
//               }
//               if (notification is ScrollStartNotification) {
//                 // 滚动开始
//               }
//               if (notification is ScrollUpdateNotification) {
//                 // 滚动中
//               }
//               if (notification is ScrollEndNotification) {
//                 // 停止滚动
//               }
//               if (notification is UserScrollNotification) {
//                 // 滚动方向
//                 // ScrollDirection.idle 停止
//                 // ScrollDirection.forward 向下滑动
//                 // ScrollDirection.reverse 向上滑动
//               }
//             }
//             return true;
//           },
//           child: NestedScrollView(
//               key: _nestedScrollKey,
//               headerSliverBuilder:
//                   (BuildContext context, bool innerBoxIsScrolled) {
//                 return <Widget>[
//                   _buildSliverAppBar(context),
//                   _buildTabHeader(),
//                 ];
//               },
//               pinnedHeaderSliverHeightBuilder: () {
//                 return statusBarHeight;
//               },
//               innerScrollPositionKeyBuilder: () {
//                 int index = _tabController.index;
//                 String tab = _tabs[index];
//                 return Key('$tab$index');
//               },
//               body: TabBarView(
//                 controller: _tabController,
//                 children: List<Widget>.generate(_tabs.length, (index) {
//                   return NestedScrollViewInnerScrollPositionKeyWidget(
//                     Key('$_tabs[index]$index'),
//                     _ListViewPage(),
//                   );
//                 }),
//               )),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Image.asset('assets/images/basics/basics_top.png'),
//         ),
//         onPressed: () {
//           _nestedScrollKey.currentState.currentInnerPosition.animateTo(0.0,
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeIn);
//         },
//       ),
//     );
//   }

//   Widget _buildSliverAppBar(BuildContext context) {
//     return SliverOpacity(
//       opacity: _appBarOpacity,
//       sliver: SliverAppBar(
//         expandedHeight: 56,
//         backgroundColor: Colors.white,
//         leadingWidth: 60,
//         automaticallyImplyLeading: true,
//         leading: FlatButton(
//           child: Stack(children: <Widget>[
//             SizedBox(
//                 child: Image.asset('assets/images/basics/basics_live.png')),
//             Positioned(
//               right: 2,
//               top: 3,
//               child: CirclePoint(
//                 color: Colors.red,
//                 radius: 3,
//               ),
//             )
//           ]),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         titleSpacing: 2,
//         title: Material(
//           shape: StadiumBorder(),
//           color: Colors.grey.withAlpha(35),
//           child: Container(
//             height: 34,
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Icon(
//                   Icons.search,
//                   color: Colors.black26,
//                   size: 20.0,
//                 ),
//                 Text(
//                   '搜索或输入网址',
//                   textAlign: TextAlign.center,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(color: Colors.black38, fontSize: 15),
//                 ),
//                 Icon(
//                   Icons.mic,
//                   color: Colors.black26,
//                   size: 23.0,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           FlatButton(
//             minWidth: 55,
//             child: SizedBox(
//               width: 25,
//               child: Image.asset('assets/images/common/add.png'),
//             ),
//             onPressed: () {
//             },
//           ),
//         ],
//         elevation: 0.0,
//       ),
//     );
//   }

//   Widget _buildTabHeader() {
//     return SliverPersistentHeader(
//       pinned: true,
//       delegate: SliverHeaderDelegate(
//         min: 50,
//         max: 50,
//         child: Container(
//           alignment: Alignment.centerLeft,
//           color: Colors.white,
//           child: ScaleTabBar(
//             isScrollable: true,
//             labelColor: Colors.black,
//             unselectedLabelColor: Colors.black45,
//             labelStyle: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//             unselectedLabelStyle: TextStyle(
//               fontSize: 16.0,
//               fontWeight: FontWeight.bold,
//             ),
//             indicator: UnderlineWidthIndicator(
//               width: 20,
//               borderSide: BorderSide(width: 3.0, color: Colors.blue),
//             ),
//             controller: _tabController,
//             labelPadding: EdgeInsets.symmetric(horizontal: 20),
//             tabs: List<Widget>.generate(_tabs.length, (index) {
//               return Tab(
//                 text: _tabs[index],
//               );
//               // return Text('index');
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _ListViewPage extends StatefulWidget {
//   @override
//   _ListViewPageState createState() => _ListViewPageState();
// }

// class _ListViewPageState extends State<_ListViewPage>
//     with AutomaticKeepAliveClientMixin {
//   List<SimpleHomeModel> itemList = [];

//   @override
//   bool get wantKeepAlive => true;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await _loadHomeData();
//     });
//   }

//   Future<void> _loadHomeData() async {
//     String jsonData =
//         await rootBundle.loadString('assets/json/simple_home.json');
//     List jsonResult = json.decode(jsonData);
//     itemList = jsonResult.map((e) {
//       return SimpleHomeModel.fromJson(e as Map<String, dynamic>);
//     }).toList();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return ListView.separated(
//       physics: const ClampingScrollPhysics(),
//       itemCount: itemList.length,
//       itemBuilder: (context, index) {
//         return _SimpleHomeItem(itemList[index]);
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return Divider(
//           color: Colors.grey.withAlpha(25),
//           thickness: 10,
//         );
//       },
//     );
//   }
// }

// class _SimpleHomeItem extends StatelessWidget {
//   final SimpleHomeModel model;

//   _SimpleHomeItem(this.model, {Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             model.title,
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 8),
//           Row(
//             children: [
//               SizedBox(
//                 width: 30,
//                 height: 30,
//                 child: ClipOval(
//                   // child: Image.network(
//                   //   'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1603365312,3218205429&fm=26&gp=0.jpg',
//                   //   fit: BoxFit.fill,
//                   // ),
//                   child: Image.asset(
//                     model.avatar,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Text(
//                 model.name,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black87,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           Text(
//             model.content,
//             style: TextStyle(
//               fontSize: 15,
//               color: Colors.black87,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(height: 7),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Text(
//                   '${model.likeCount} 赞同 · ${model.commentCount} 评论',
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Icon(
//                     Icons.more_horiz,
//                     size: 20,
//                     color: Colors.black45,
//                   ),
//                   style: ButtonStyle(
//                     elevation: MaterialStateProperty.all(0),
//                     minimumSize: MaterialStateProperty.all(Size(1, 1)),
//                     padding: MaterialStateProperty.all(EdgeInsets.zero),
//                     backgroundColor:
//                         MaterialStateProperty.all(Colors.transparent),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
