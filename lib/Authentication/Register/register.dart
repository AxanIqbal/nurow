import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Authentication/Register/register_mobile.dart';

class RegisterPage extends GetResponsiveView {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: screen.responsiveValue(
        desktop: const RegisterMobile(),
        tablet: const RegisterMobile(),
        mobile: const RegisterMobile(),
        watch: const RegisterMobile(),
      ),
    );
  }
}
