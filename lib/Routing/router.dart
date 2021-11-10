import 'package:flutter/material.dart';
import 'package:nurow/Routing/route_names.dart';
import 'package:nurow/Screens/audit.dart';
import 'package:nurow/Screens/select_image.dart';
import 'package:nurow/Screens/select_patient.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case analysisPage:
      return _getPageRoute(const SelectImage());
    case patientDetailsPage:
      return _getPageRoute(const SelectPatient());
    case auditPage:
      return _getPageRoute(const Audit());
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
