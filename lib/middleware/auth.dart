import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/controller/auth.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  redirect(String? route) {
    AuthController firebase = AuthController.instance;
    return !firebase.isLoggedIn.value
        ? const RouteSettings(name: "/Login")
        : null;
  }
}

class AuthReverseMiddleware extends GetMiddleware {
  @override
  redirect(String? route) {
    AuthController firebase = AuthController.instance;
    return firebase.isLoggedIn.value
        ? const RouteSettings(name: "/")
        : null;
  }
}
