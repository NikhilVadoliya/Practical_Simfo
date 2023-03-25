import 'package:simform_practical/screens/home/home_screen.dart';
import 'package:simform_practical/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class NavigatorRoute {
  NavigatorRoute._();

  static const String root = '/';
  static const String home = '/home';
  static const String detail = '/detail';

  static Map<String, WidgetBuilder> routes = {
    root: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
  };
}
