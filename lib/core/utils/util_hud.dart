import 'dart:math' as math show sin, pi;

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

enum HUDStatus { loading, toast, attach, dialog, all }

class HUD {
  static final observer = FlutterSmartDialog.observer;

  static TransitionBuilder init() {
    return FlutterSmartDialog.init();
  }

  static Future<void> loading({String msg = ''}) async {
    await SmartDialog.showLoading(
      maskColor: Colors.black12,
      builder: (context) => LoadingView(msg: msg),
    );
  }

  static Future<void> toast({String msg = ''}) async {
    await SmartDialog.showToast(
      msg,
      maskColor: Colors.black12,
      builder: (context) => ToastText(msg: msg),
    );
  }

  static Future<void> alter() async {
    await HUD.dialog(const AlterWidget());
  }

  static Future<T?> dialog<T>(Widget widget) async {
    return await SmartDialog.show<T>(builder: (_) {
      return widget;
    });
  }

  static dismiss({
    HUDStatus status = HUDStatus.all,
  }) {
    switch (status) {
      case HUDStatus.loading:
        SmartDialog.dismiss(status: SmartStatus.loading);
        break;
      case HUDStatus.toast:
        SmartDialog.dismiss(status: SmartStatus.toast);
        break;
      case HUDStatus.attach:
        SmartDialog.dismiss(status: SmartStatus.allAttach);
        break;
      case HUDStatus.dialog:
        SmartDialog.dismiss(status: SmartStatus.dialog);
        break;
      case HUDStatus.all:
        SmartDialog.dismiss();
        break;
    }
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key? key,
    required this.msg,
  }) : super(key: key);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 18),
              const LoadingAnimation(),
              if (msg.isNotEmpty) LoadingText(msg: msg),
              SizedBox(height: msg.isNotEmpty ? 10 : 18),
            ],
          ),
        ),
      ],
    );
  }
}

class LoadingText extends StatelessWidget {
  const LoadingText({
    Key? key,
    required this.msg,
  }) : super(key: key);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        msg,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LoadingAnimation extends StatefulWidget {
  final Duration duration;
  final Curve curve;

  const LoadingAnimation(
      {Key? key,
      this.duration = const Duration(milliseconds: 1400),
      this.curve = Curves.linear})
      : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Animation> _animations = [];

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
    List.generate(3, (index) {
      _animations.add(DelayTween(begin: 0.2, end: 1.0, delay: 0.2 * index)
          .animate(CurvedAnimation(parent: _controller, curve: widget.curve)));
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _animations[index].value,
                child: const SizedBox(
                  width: 8,
                  height: 8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

class DelayTween extends Tween<double> {
  final double delay;

  DelayTween({required double begin, required double end, required this.delay})
      : super(begin: begin, end: end);

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class ToastText extends StatelessWidget {
  const ToastText({
    Key? key,
    required this.msg,
  }) : super(key: key);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Text(
        msg,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AlterWidget extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget? content;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool autoClose;
  final VoidCallback? onCustom;
  final Color? cancelTextColor;
  final Color? confirmTextColor;
  final String? textConfirm;
  final String? textCancel;
  final String? textCustom;
  final Widget? confirm;
  final Widget? cancel;
  final Widget? custom;
  final Color? backgroundColor;
  final Color? confirmButtonColor;
  final Color? cancelButtonColor;
  final String middleText;
  final TextStyle? middleTextStyle;
  final double radius;
  final List<Widget> actions;

  const AlterWidget({
    Key? key,
    this.title = 'Alert',
    this.titleStyle,
    this.content,
    this.onConfirm,
    this.onCancel,
    this.autoClose = true,
    this.onCustom,
    this.cancelTextColor,
    this.confirmTextColor,
    this.textConfirm,
    this.textCancel,
    this.textCustom,
    this.confirm,
    this.cancel,
    this.custom,
    this.backgroundColor,
    this.confirmButtonColor,
    this.cancelButtonColor,
    this.middleText = 'Dialog made in 3 lines of code',
    this.middleTextStyle,
    this.radius = 20.0,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leanCancel = onCancel != null || textCancel != null;
    final leanConfirm = onConfirm != null || textConfirm != null;
    final actions = [...this.actions];

    if (cancel != null) {
      actions.add(cancel!);
    } else {
      if (leanCancel) {
        actions.add(ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: cancelButtonColor,
          ),
          onPressed: () {
            if (autoClose) {
              Navigator.pop(context);
            }
            onCancel?.call();
          },
          child: Text(
            textCancel ?? '取消',
            style: TextStyle(
              color: cancelTextColor ?? Colors.black,
            ),
          ),
        ));
      }
    }
    if (confirm != null) {
      actions.add(confirm!);
    } else {
      if (leanConfirm) {
        actions.add(
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: confirmButtonColor ?? Colors.black,
            ),
            child: Text(
              textConfirm ?? '确认',
              style: TextStyle(
                color: confirmTextColor ?? Colors.black,
              ),
            ),
            onPressed: () {
              onConfirm?.call();
            },
          ),
        );
      }
    }
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: titleStyle,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(
              minHeight: 90,
            ),
            alignment: Alignment.center,
            child: content ??
                Text(
                  middleText,
                  textAlign: TextAlign.center,
                  style: middleTextStyle,
                ),
          ),
          ElevatedButtonTheme(
            data: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                fixedSize: const Size.fromHeight(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: actions.map((e) => Expanded(child: e)).toList(),
            ),
          ),
        ],
      ),
      // actions: actions, // ?? <Widget>[cancelButton, confirmButton],
      buttonPadding: EdgeInsets.zero,
    );
  }
}
