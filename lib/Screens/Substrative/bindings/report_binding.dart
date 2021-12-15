import 'package:get/get.dart';
import 'package:nurow/Screens/Substrative/controller/report_controller.dart';

class SubReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubReportController());
  }
}
