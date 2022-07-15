import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_persistent_keyboard_height/flutter_persistent_keyboard_height.dart';
import 'package:notes/modules/demos/im/widgets/chat.tools.dart';
import 'package:notes/modules/demos/im/widgets/chat_emoji.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({
    Key? key,
    this.onSubmit,
    this.onChange,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final void Function(String)? onSubmit;
  final void Function(String)? onChange;

  @override
  ChatInputState createState() => ChatInputState();
}

class ChatInputState extends State<ChatInput> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  StreamSubscription? _keyboardSubscribe;

  double _keyboardHeight = 0.0;
  bool _keyboardVisible = false;

  bool _showEmoji = false;
  final _emojiHeight = 300.0;

  bool _showTools = false;
  final _toolsHeight = 200.0;

  double paddingBottom = 0.0;

  @override
  void initState() {
    super.initState();
    _addKeyboardListener();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        paddingBottom = MediaQuery.of(context).padding.bottom;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _keyboardHeight = PersistentKeyboardHeight.of(context).keyboardHeight;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          if (mounted) {
            _showEmoji = false;
            _showTools = false;
            _close();
          }
        },
        child: Column(
          children: [
            Expanded(
              child: widget.child ?? Container(),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildTextField(),
                      ),
                      _buildEmojiButton(),
                      const SizedBox(width: 2),
                      _buildToolsButton(),
                    ],
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ),
            AnimatedContainer(
              height: _showTools
                  ? _toolsHeight + paddingBottom
                  : (_showEmoji
                      ? _emojiHeight + paddingBottom
                      : (_keyboardVisible
                          ? _keyboardHeight
                          : 0.0 + paddingBottom)),
              duration: const Duration(milliseconds: 250),
              curve: Curves.ease,
              child: _showTools
                  ? _buildTools()
                  : (_showEmoji ? _buildEmoji() : null),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF3F3F4),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextField(
        controller: _textController,
        focusNode: _focusNode,
        minLines: 1,
        maxLines: 5,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
        decoration: const InputDecoration(
          isDense: true,
          filled: true,
          hintText: '请输入',
          fillColor: Colors.transparent,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 5,
          ),
          border: InputBorder.none,
          suffix: null,
          counter: null,
          counterText: '',
        ),
        cursorColor: Colors.black87,
        onChanged: (value) {
          widget.onChange?.call(value);
        },
        onSubmitted: _submit,
      ),
    );
  }

  Widget _buildEmojiButton() {
    return IconButton(
      icon: Icon(
        _showEmoji ? Icons.emoji_emotions_outlined : Icons.emoji_emotions,
      ),
      padding: EdgeInsets.zero,
      onPressed: () {
        if (!_showEmoji) {
          _focusNode.unfocus();
          _showEmoji = true;
          _showTools = false;
        } else {
          _focusNode.requestFocus();
        }
        setState(() {});
      },
    );
  }

  Widget _buildToolsButton() {
    return IconButton(
      icon: Icon(_showTools ? Icons.add : Icons.add_circle_sharp),
      padding: EdgeInsets.zero,
      onPressed: () {
        if (!_showTools) {
          _focusNode.unfocus();
          _showEmoji = false;
          _showTools = true;
        } else {
          _focusNode.requestFocus();
        }
        setState(() {});
      },
    );
  }

  // Widget _buildSubmit() {
  //   return TextButton(
  //     onPressed: () {
  //       _submit(_textController.text);
  //     },
  //     child: const Text(
  //       '确定',
  //       style: TextStyle(
  //         fontSize: 15.0,
  //         color: Colors.black87,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildEmoji() {
    return ChatEmoji(
      onEmojiSelected: (emoji) {
        _textController
          ..text += emoji
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: _textController.text.length),
          );
      },
      onBackspacePressed: () {
        _textController
          ..text = _textController.text.characters.skipLast(1).toString()
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: _textController.text.length),
          );
      },
    );
  }

  Widget _buildTools() {
    return ChatTools(
      onSelected: (index) {},
    );
  }

  void _addKeyboardListener() {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      _keyboardSubscribe =
          KeyboardVisibilityController().onChange.listen((visible) {
        _keyboardVisible = visible;
        setState(() {});
        if (!visible) {
          _close();
        } else {
          _showEmoji = false;
          _showTools = false;
          _keyboardHeight = PersistentKeyboardHeight.of(context).keyboardHeight;
          setState(() {});
        }
      });
    }
  }

  void _submit(String value) async {
    widget.onSubmit?.call(value);
    _close();
  }

  void _close() {
    if (mounted) {
      _focusNode.unfocus();
      _keyboardHeight = 0.0 + paddingBottom;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _keyboardSubscribe?.cancel();
    _textController.dispose();
    super.dispose();
  }
}
