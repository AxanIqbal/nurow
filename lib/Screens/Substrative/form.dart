import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/Substrative/widgets/multiform.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/locator.dart';

import 'analyse.dart';
import 'controller/form_controller.dart';

class SubForm extends GetView<SubFormController> {
  const SubForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SubFormController());

    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Obx(
        () => AnimatedCrossFade(
          firstChild: MultiForm(
            formKey: controller.formKey,
            title: "First Radiograph",
            onPress: (xray) {
              controller.first.value = false;
              controller.xray1.value = xray;
            },
          ),
          secondChild: MultiForm(
            formKey: controller.formKey2,
            title: "Second Radiograph",
            onPress: (xray) {
              controller.first.value = true;
              controller.xray2.value = xray;
              locator<NavigationService>().navigateToWidget(
                () => const SubAnalyse(),
              );
            },
          ),
          crossFadeState: controller.first.value
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
