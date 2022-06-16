import 'package:get/get.dart';
import 'package:notes/pages/simple.dart';

import 'package:notes/routes/paths.dart';

import 'package:notes/splash.dart';
import 'package:notes/pages/home.dart';

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
        transition: Transition.noTransition,
        children: [
          GetPage(
            name: Paths.simple,
            page: () => const SimplePage(
              simple: '',
            ),
          ),
        ])
  ];
}
