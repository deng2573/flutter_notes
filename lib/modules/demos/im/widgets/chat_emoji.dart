import 'dart:io';

import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatEmoji extends StatelessWidget {
  final void Function(String) onEmojiSelected;

  final void Function() onBackspacePressed;

  const ChatEmoji({
    Key? key,
    required this.onEmojiSelected,
    required this.onBackspacePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmojiPicker(
      onEmojiSelected: (Category category, Emoji emoji) {
        onEmojiSelected(emoji.emoji);
      },
      onBackspacePressed: onBackspacePressed,
      config: Config(
          columns: 7,
          emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
          verticalSpacing: 0,
          horizontalSpacing: 0,
          gridPadding: EdgeInsets.zero,
          initCategory: Category.RECENT,
          bgColor: const Color(0xFFF2F2F2),
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          progressIndicatorColor: Colors.blue,
          backspaceColor: Colors.blue,
          skinToneDialogBgColor: Colors.white,
          skinToneIndicatorColor: Colors.grey,
          enableSkinTones: true,
          showRecentsTab: true,
          recentsLimit: 28,
          replaceEmojiOnLimitExceed: false,
          noRecents: const Text(
            'No Recents',
            style: TextStyle(fontSize: 20, color: Colors.black26),
            textAlign: TextAlign.center,
          ),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: const CategoryIcons(),
          buttonMode: ButtonMode.MATERIAL),
    );
  }
}
