import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({
    Key? key,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.hintText = '请输入',
    this.submitText = '确定',
    this.maxLines,
    this.maxLength = 20,
    this.minLines = 1,
    this.onSubmit,
    this.onChange,
    this.child,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String? submitText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;

  final Widget? child;

  final void Function(String)? onSubmit;
  final void Function(String)? onChange;

  @override
  ChatInputState createState() => ChatInputState();
}

class ChatInputState extends State<ChatInput> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;
  StreamSubscription? _keyboardSubscribe;

  int _textLength = 0;

  bool resizeToAvoidBottomInset = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    // _focusNode.requestFocus();
    _addKeyboardListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
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
                      _buildSubmit()
                    ],
                  ),
                  const SizedBox(height: 2),
                  _buildActions(),
                  const SizedBox(height: 2),
                ],
              ),
            ),
            // if (resizeToAvoidBottomInset)
            //   const SizedBox(height: 0)
            // else
            AnimatedContainer(
              color: Colors.green,
              height: resizeToAvoidBottomInset ? 270 : 300,
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease,
            )
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
        controller: _controller,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        // autofocus: true,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          hintText: widget.hintText,
          fillColor: Colors.transparent,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 5,
          ),
          border: InputBorder.none,
          suffix: widget.maxLines == 1 && widget.maxLength != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '$_textLength/${widget.maxLength}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                )
              : null,
          counter: widget.maxLines != 1 && widget.maxLength != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    '$_textLength/${widget.maxLength}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                )
              : null,
          counterText: '',
        ),
        cursorColor: Colors.black87,
        onChanged: (value) {
          widget.onChange?.call(value);
          setState(() {
            _textLength = value.length;
          });
        },
        onSubmitted: _submit,
      ),
    );
  }

  Widget _buildSubmit() {
    return TextButton(
      onPressed: () {
        _submit(_controller.text);
      },
      child: Text(
        widget.submitText ?? '确定',
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icons.phone,
        Icons.email_outlined,
        Icons.lock_outlined,
        Icons.book_online,
        Icons.share,
        Icons.book_outlined,
      ].map((icon) {
        return IconButton(
          icon: Icon(icon),
          padding: EdgeInsets.zero,
          onPressed: () {
            resizeToAvoidBottomInset = false;
            _focusNode.unfocus();
            setState(() {});
          },
        );
      }).toList(),
    );
  }

  void _addKeyboardListener() {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      _keyboardSubscribe =
          KeyboardVisibilityController().onChange.listen((visible) {
        if (!visible) _close();
      });
    }
  }

  void _close() {
    if (mounted) {
      _focusNode.unfocus();
    }
  }

  void _submit(String value) async {
    widget.onSubmit?.call(value);
    _close();
  }

  @override
  void dispose() {
    _keyboardSubscribe?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
