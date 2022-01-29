import 'package:get/get.dart';
import 'package:nurow/Authentication/Login/login.dart';
import 'package:nurow/Authentication/Register/register.dart';
import 'package:nurow/Screens/Substrative/select.dart';
import 'package:nurow/Screens/Xray/select_image.dart';
import 'package:nurow/Screens/audit.dart';
import 'package:nurow/Screens/loading.dart';
import 'package:nurow/Screens/select_patient.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/middleware/auth.dart';

List<GetPage> getRoutes = [
  GetPage(
    name: '/',
    page: () => CustomScaffold(body: SelectImage()),
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
    page: () => RegisterPage(),
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
    page: () => CustomScaffold(body: const SelectPatient()),
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: '/audit',
    page: () => CustomScaffold(body: const Audit()),
    middlewares: [
      AuthMiddleware(),
    ],
  ),
];
