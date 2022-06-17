import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:notes/modules/simple/models/simple_model.dart';
import 'package:notes/modules/simple/controllers/simple_controller.dart';

class SimplePage extends GetView<SimpleController> {
  const SimplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SimpleController());
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        final items = controller.items;
        return ListView.builder(
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildSimpleItem(item);
          },
          itemCount: items.length,
        );
      }),
    );
  }

  Widget _buildSimpleItem(SimpleModel item) {
    return InkWell(
      enableFeedback: false,
      onTap: () {
        controller.openSimplePage(item);
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
}
