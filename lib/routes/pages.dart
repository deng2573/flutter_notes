import 'package:get/get.dart';

import 'package:notes/routes/paths.dart';

import 'package:notes/splash.dart';
import 'package:notes/modules/home/pages/home.dart';
import 'package:notes/modules/sample/pages/sample.dart';
import 'package:notes/modules/demo/nested/pages/demo_nested.dart';
import 'package:notes/modules/demo/web3/pages/demo_web3.dart';

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
      name: Paths.demoNested,
      page: () => const DemoNestedPage(),
    ),
    GetPage(
      name: Paths.demoWeb3,
      page: () => const DemoWeb3Page(),
    ),
  ];
}
