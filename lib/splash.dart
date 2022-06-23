import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:notes/application.dart';
import 'package:notes/routes/paths.dart';
import 'package:notes/core/utils/util_hud.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      HUD.loading();
      await Application.init();
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed(Paths.home);
      HUD.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/launch/launch_light.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
