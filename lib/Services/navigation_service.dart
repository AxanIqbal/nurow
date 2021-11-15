import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateToWidget(dynamic route) {
    return navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (BuildContext context) => route()));
  }

  dynamic goBack() {
    return navigatorKey.currentState!.pop();
  }
}
