import 'package:get/get.dart';
import 'package:notes/modules/sample/pages/sample.dart';

import 'package:notes/routes/paths.dart';

import 'package:notes/splash.dart';
import 'package:notes/modules/home/pages/home.dart';
import 'package:notes/modules/demo/pages/demo_nested.dart';

class Pages {
  static const root = Paths.splash;

  static final routes = [
    GetPage(
      name: Paths.splash,
      page: () => const Splash(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Paths.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Paths.sample,
      page: () => const SamplePage(),
    ),
    GetPage(
      name: Paths.demo,
      page: () => const DemoNestedPage(),
    ),
  ];
}
