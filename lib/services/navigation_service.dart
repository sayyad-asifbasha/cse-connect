import 'package:cse_connect/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cse_connect/widgets/snackbar.dart';
import 'package:cse_connect/enums/enums.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
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
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: commonSnackBar(
          duration: duration,
          messageType: MessageType.info,
          errorMessage: message,
        ),
        behavior: SnackBarBehavior.floating,
        duration: duration,
        padding: EdgeInsets.zero,
        backgroundColor: Theme.of(context).colorScheme.onTertiaryFixedVariant,
      ),
    );
  }
}
