import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/routes/pages.dart';
import 'package:notes/theme.dart';
import 'package:notes/core/utils/util_hud.dart';
import 'package:flutter_persistent_keyboard_height/flutter_persistent_keyboard_height.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Notes',
      useInheritedMediaQuery: true,
      navigatorObservers: [HUD.observer],
      builder: (context, child) {
        final hudBuilder = HUD.init();
        child = hudBuilder(context, child);
        return PersistentKeyboardHeightProvider(
          child: child,
        );
      },
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      getPages: Pages.routes,
      initialRoute: Pages.root,
    );
  }
}
