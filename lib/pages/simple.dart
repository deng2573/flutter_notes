import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/core/utils/util_hud.dart';
import 'package:notes/core/utils/util_input.dart';
import 'package:notes/core/utils/util_log.dart';

class SimplePage extends StatefulWidget {
  final String simple;
  const SimplePage({
    Key? key,
    required this.simple,
  }) : super(key: key);

  @override
  _SimplePageState createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  List<SimpleModel> _list = <SimpleModel>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadList();
    });
  }

  Future<void> _loadList() async {
    final data =
        await rootBundle.loadString('assets/json/${widget.simple}.json');
    final result = json.decode(data) as List<dynamic>;
    _list = result.map((e) => SimpleModel.fromJson(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.simple.toUpperCase()),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = _list[index];
          return _buildSimpleItem(item);
        },
        itemCount: _list.length,
      ),
    );
  }

  Widget _buildSimpleItem(SimpleModel item) {
    return InkWell(
      enableFeedback: false,
      onTap: () {
        _onTapItem(item);
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 16),
                    child: Text(
                      item.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
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

  void _onTapItem(SimpleModel model) async {
    switch (widget.simple) {
      case 'utils':
        switch (model.id) {
          case 0:
            HUD.loading();
            await Future.delayed(const Duration(seconds: 5));
            HUD.dismiss();
            break;
          case 1:
            HUD.toast(msg: '加载成功');
            break;
          case 2:
            HUD.loading();
            break;
          case 3:
            HUD.loading();
            break;
          case 4:
            Input.show(
              context: context,
              hintText: '请输入',
            );
            break;
          case 5:
            Log.v('verbose1');
            Log.i('verbose1');
            Log.d('verbose1');
            Log.w('verbose1');
            Log.e('error1');
            Log.e('error2');
            Log.e('error3');
            break;
        }
    }
  }
}

class SimpleModel {
  int id;
  String? title;

  SimpleModel({
    required this.id,
    this.title,
  });

  factory SimpleModel.fromJson(Map<String, dynamic> json) {
    return SimpleModel(
      id: json['id'] as int,
      title: json['title'] as String?,
    );
  }
}
