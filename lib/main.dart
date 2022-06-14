import 'package:flutter/material.dart';

import 'package:notes/theme.dart';
import 'package:notes/pages/home.dart';
import 'package:notes/core/utils/util_hud.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      useInheritedMediaQuery: true,
      navigatorObservers: [HUD.observer],
      builder: HUD.init(),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}
