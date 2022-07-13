import 'package:flutter/material.dart';

import 'package:notes/core/extesion/extesion_color.dart';
import 'package:notes/modules/demos/im/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatInput(
      child: ListView.builder(
        itemCount: 500,
        itemBuilder: (context, index) {
          return Card(
            color: ColorExtension.random,
            child: const SizedBox(
              height: 100,
            ),
          );
        },
      ),
    );
  }
}
