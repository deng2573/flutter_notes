import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DialogX {
  static final observer = FlutterSmartDialog.observer;

  static TransitionBuilder init() {
    return FlutterSmartDialog.init();
  }

  static void show(Widget widget) {
    SmartDialog.show(builder: (_) {
      return widget;
    });
  }

  static void alter() {
    DialogX.show(const AlterWidget());
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
    final _actions = [...actions];

    if (cancel != null) {
      _actions.add(cancel!);
    } else {
      if (leanCancel) {
        _actions.add(ElevatedButton(
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
      _actions.add(confirm!);
    } else {
      if (leanConfirm) {
        _actions.add(
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
              children: _actions.map((e) => Expanded(child: e)).toList(),
            ),
          ),
        ],
      ),
      // actions: actions, // ?? <Widget>[cancelButton, confirmButton],
      buttonPadding: EdgeInsets.zero,
    );
  }
}
