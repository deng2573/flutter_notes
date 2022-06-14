import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:notes/pages/simple.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeModel> _list = <HomeModel>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadList();
    });
  }

  Future<void> _loadList() async {
    final data = await rootBundle.loadString('assets/json/home.json');
    final result = json.decode(data) as List<dynamic>;
    _list = result.map((e) => HomeModel.fromJson(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = _list[index];
          return _buildHomeItem(item);
        },
        itemCount: _list.length,
      ),
    );
  }

  Widget _buildHomeItem(HomeModel item) {
    return InkWell(
      enableFeedback: false,
      onTap: () {
        _openSimplePage(item);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(90, 226, 226, 226),
              offset: Offset(1, 1),
              blurRadius: 5,
            ),
            BoxShadow(
              color: Color.fromARGB(90, 226, 226, 226),
              offset: Offset(-1, 1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, right: 16),
                    child: Text(
                      item.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, top: 5, right: 16, bottom: 10),
                    child: Text(
                      item.desc ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.chevron_right,
                color: Colors.grey[600],
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openSimplePage(HomeModel model) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SimplePage(
          simple: (model.title ?? '').toLowerCase(),
        ),
      ),
    );
  }
}

class HomeModel {
  int id;
  String? title;
  String? desc;

  HomeModel({
    required this.id,
    this.title,
    this.desc,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        id: json['id'] as int,
        title: json['title'] as String?,
        desc: json['desc'] as String?);
  }
}
