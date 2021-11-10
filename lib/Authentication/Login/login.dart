import 'package:flutter/material.dart';
import 'package:nurow/Authentication/Login/login_desktop.dart';
import 'package:nurow/Authentication/Login/login_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return sizingInformation.isMobile
                ? const MobileMode()
                : const DesktopMode();
          },
        ));
  }
}
