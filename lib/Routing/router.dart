import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nurow/Routing/route_names.dart';
import 'package:nurow/Screens/select_image.dart';
import 'package:nurow/Screens/xray_form.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  log('generateRoute: ${settings.name}');
  switch (settings.name) {
    case xRayForm:
      return _getPageRoute(const XRayForm());
    // case xRayView:
    //   return _getPageRoute(const XRayView(data: data));
    default:
      return _getPageRoute(const SelectImage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(
    child: child,
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  _FadeRoute({required this.child})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
