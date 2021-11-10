import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nurow/Authentication/Login/login.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  RxBool isLoggedIn = false.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rxn<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // userProfile = null;
      Get.offAll(() => const LoginPage(),routeName: '/LoginPage');
    } else {
      // Get.offAll(() => HomeLayout());
    }
  }

}