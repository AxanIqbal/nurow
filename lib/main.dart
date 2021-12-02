import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';
import 'package:nurow/Authentication/Login/login.dart';
import 'package:nurow/Authentication/Register/register.dart';
import 'package:nurow/Screens/layout_template.dart';
import 'package:nurow/Screens/loading.dart';
import 'package:nurow/controller/auth.dart';
import 'package:nurow/locator.dart';
import 'package:nurow/middleware/auth.dart';
// import 'package:nurow/Screens/select_image.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp();
  Get.put(AuthController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nurow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      initialRoute: '/init',
      getPages: [
        GetPage(name: '/', page: () => const HomeLayout(), middlewares: [
          AuthMiddleware(),
        ]),
        GetPage(
          name: '/Login',
          page: () => LoginPage(),
          middlewares: [AuthReverseMiddleware()],
        ),
        GetPage(
          name: '/Register',
          page: () => const RegisterPage(),
          middlewares: [AuthReverseMiddleware()],
        ),
        GetPage(
          name: '/init',
          page: () => const Loading(),
        ),
      ],
      // home: const Center(
      //   child: HomeLayout(),
      // ),
    );
  }
}
