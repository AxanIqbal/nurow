import 'package:get/get.dart';
import 'package:nurow/Screens/Substrative/controller/form_controller.dart';

class SubFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubFormController>(
      () => SubFormController(),
    );
  }
}
