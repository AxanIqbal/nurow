import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Authentication/Login/login_desktop.dart';
import 'package:nurow/Authentication/Login/login_mobile.dart';

class LoginPageController extends GetxController {}

class LoginPage extends GetResponsiveView<LoginPageController> {
  LoginPage({Key? key}) : super(key: key);
  static const String route = '/login';

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: screen.responsiveValue(
        mobile: const MobileMode(),
        watch: const MobileMode(),
        tablet: const DesktopMode(),
        desktop: const DesktopMode(),
      ),
      // body: ResponsiveBuilder(
      //   builder: (context, sizingInformation) {
      //     return sizingInformation.isMobile
      //         ? const MobileMode()
      //         : const DesktopMode();
      //   },
      // ),
    );
  }
}
