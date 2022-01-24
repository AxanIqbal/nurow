import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';
import 'package:nurow/Authentication/Login/login.dart';
import 'package:nurow/Authentication/Register/register.dart';
import 'package:nurow/Screens/loading.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/controller/auth.dart';
import 'package:nurow/firebase_options.dart';
import 'package:nurow/middleware/auth.dart';

import 'Screens/Substrative/select.dart';
import 'Screens/Xray/select_image.dart';
import 'Screens/audit.dart';
import 'Screens/select_patient.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController(), permanent: true);
  // Get.lazyPut<DataService>(() => DataService());
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
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(
          name: '/',
          page: () => const CustomScaffold(body: SelectImage()),
          middlewares: [
            AuthMiddleware(),
          ],
        ),
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
        GetPage(
          name: '/selectSubAnalysis',
          page: () => CustomScaffold(body: SelectSubAnalysis()),
          middlewares: [
            AuthMiddleware(),
          ],
        ),
        GetPage(
          name: '/patientsSelect',
          page: () => const CustomScaffold(body: SelectPatient()),
          middlewares: [
            AuthMiddleware(),
          ],
        ),
        GetPage(
          name: '/audit',
          page: () => const CustomScaffold(body: Audit()),
          middlewares: [
            AuthMiddleware(),
          ],
        ),
      ],
      // home: const Center(
      //   child: HomeLayout(),
      // ),
    );
  }
}
