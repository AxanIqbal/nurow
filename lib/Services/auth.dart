import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/controller/auth.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthController autho = AuthController.instance;

  Future<dynamic> registerWithEmail(
      {required String email,
      required String password,
      required String userName,
      required BuildContext context}) async {
    var userDoc = await firestore.collection("users").doc(userName).get();

    if (password.length > 6) {
      if (!userDoc.exists) {
        try {
          UserCredential cred = await auth.createUserWithEmailAndPassword(
              email: email, password: password);
          await firestore.collection('users').doc(userName).set({
            'email': email,
            'userName': userName,
            'creationTime': Timestamp.now(),
            'lastSignInTime': FieldValue.arrayUnion([Timestamp.now()]),
            'lastLogOutTime': FieldValue.arrayUnion([])
          });
          cred.user!.sendEmailVerification();
          await cred.user!.updateDisplayName(userName);
          // debugPrint("testing this fellow");
          // debugPrint(cred.user);
          await showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: const Center(
                    child: Text(
                      "An verification email has been sent to you. Please complete the verification to continue",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
          Get.offAllNamed('/Login');
          // Navigator.of(context).pop();
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => LoginPage()),
          // );
          return true;
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Center(
                    child: Text(
                      e.toString(),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
          debugPrint(e.toString());
          return e;
        }
      } else {
        await showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.28,
                height: MediaQuery.of(context).size.height * 0.25,
                child: const Center(
                  child: Text(
                    "Username Already Exists, Choose a different one!",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }
    } else {
      await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.28,
              height: MediaQuery.of(context).size.height * 0.25,
              child: const Center(
                child: Text(
                  "Please Use a Password with more than 6 characters ",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }

  Future<dynamic> signInWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential cred = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // print(cred.user);
      if (cred.user!.emailVerified) {
        autho.signInEntry(displayName: cred.user!.displayName);
        return true;
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.25,
                child: const Center(
                  child: Text(
                    "An verification email has been sent to you. Please complete the verification to continue",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            );
          },
        );
        return false;
      }
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Center(
                child: Text(
                  e.message ?? 'Unknown Error',
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        },
      );
      debugPrint(e.toString());
      return e;
    }
  }
}
