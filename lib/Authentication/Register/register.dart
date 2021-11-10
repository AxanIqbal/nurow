import 'package:flutter/material.dart';
import 'package:nurow/Authentication/Register/register_desktop.dart';
import 'package:nurow/Authentication/Register/register_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const String route = '/login';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return sizingInformation.isMobile
                ? const RegisterMobile()
                : const RegisterDesktop();
          },
        ));
  }
}
