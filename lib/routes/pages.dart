import 'package:get/get.dart';

import 'package:notes/routes/paths.dart';

import 'package:notes/splash.dart';
import 'package:notes/modules/home/pages/home.dart';
import 'package:notes/modules/simple/pages/simple.dart';

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
      name: Paths.simple,
      page: () => const SimplePage(),
    ),
  ];
}
