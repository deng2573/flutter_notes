import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedirectMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String? route) {
    return const RouteSettings(name: '/second');
  }
}
