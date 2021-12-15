import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/Substrative/widgets/multiform.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Screens/widgets/patient_table.dart';
import 'package:nurow/models/patient.dart';

import 'analyse_view.dart';
import 'controller/form_controller.dart';

class SubForm extends GetView<SubFormController> {
  const SubForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handle(Patient patientX) {
      controller.patient.value = patientX;
      controller.isNew.value = false;
      Get.back();
    }

    return CustomScaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedCrossFade(
              firstChild: MultiForm(
                formKey: controller.formKey,
                title: "First Radiograph",
                onPress: (xray) {
                  controller.first.value = false;
                  controller.xray1.value = xray;
                  controller.formKey2.value.currentState!.fields['xrayLabel']!
                      .didChange(controller
                          .formKey.value.currentState!.value['xrayLabel']);
                },
              ),
              secondChild: MultiForm(
                formKey: controller.formKey2,
                title: "Second Radiograph",
                radiograph:
                    controller.formKey.value.currentState?.value['xrayLabel'],
                onPress: (xray) {
                  controller.first.value = true;
                  final patient = controller.patient.value!;
                  final xray1 = controller.xray1.value!;
                  // Get.delete(tag: 'SubForm');
                  Get.to(
                    () => SubAnalyseView(
                      patient: patient,
                      xray1: xray1,
                      xray2: xray,
                      isNew: controller.isNew.value,
                    ),
                  );
                },
              ),
              crossFadeState: controller.first.value
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 500),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                if (controller.patient.value == null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      child: Container(
                        color: Colors.grey[350],
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        child: PatientsTable(
                          handle: handle,
                        ),
                      ),
                    ),
                  );
                } else {
                  controller.patient.value = null;
                  controller.isNew.value = true;
                }
              },
              child: Obx(
                () => Text(controller.patient.value == null
                    ? 'Already exist?'
                    : 'Create new?'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
