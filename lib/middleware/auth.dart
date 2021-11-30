import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/controller/auth.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  redirect(String? route) {
    AuthController firebase = AuthController.instance;
    return firebase.firebaseUser.value == null
        ? const RouteSettings(name: "/Login")
        : null;
  }
}
