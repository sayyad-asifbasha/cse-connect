import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService
{
  GlobalKey<NavigatorState> navigatorKey=GlobalKey<NavigatorState>();
  Future<dynamic> pushScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAndPushScreen(String routeName, {dynamic arguments}) {
    navigatorKey.currentState!.pop();
    return pushScreen(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }
  void popScreen() {
    navigatorKey.currentState!.pop();
  }

  Future<dynamic> removeAllAndPush(
      String routeName,
      String tillRoute, {
        dynamic arguments,
      }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(tillRoute),
      arguments: arguments,
    );
  }
  void showSnackBar(
      String message, {
        Duration duration = const Duration(seconds: 2),
      }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: duration,
        content: Text(
          message,
        ),
      ),
    );
  }
}