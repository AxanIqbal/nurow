import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  RxBool isLoggedIn = false.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rxn<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void signInEntry({String? displayName}) {
    firestore
        .collection('users')
        .doc(displayName ?? firebaseUser.value!.displayName)
        .update(
      {
        'lastSignInTime': FieldValue.arrayUnion([Timestamp.now()])
      },
    ).then(
      (value) => Get.snackbar(
        "Success",
        "Updated the Last Logged In Time",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      ),
      onError: (error) => Get.snackbar(
        "Error",
        error.toString(),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      ),
    );
  }

  Future<void> signOutEntry() async {
    await firestore
        .collection('users')
        .doc(firebaseUser.value!.displayName)
        .update({
      'lastLogOutTime': FieldValue.arrayUnion([Timestamp.now()])
    }).then(
      (value) => FirebaseAuth.instance.signOut(),
      onError: (error) => Get.snackbar(
        "Error",
        error.toString(),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      ),
    );
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      isLoggedIn.value = false;
      Get.offAllNamed('/Login');
    } else {
      isLoggedIn.value = true;
      Get.offAllNamed('/');
    }
  }
}
