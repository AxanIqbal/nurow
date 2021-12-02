import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:nurow/models/patient.dart';

class XrayFormController extends GetxController {
  static XrayFormController instance = Get.find();
  Rxn<Patient?> patient = Rxn<Patient?>(null);
  final formKey = GlobalKey<FormBuilderState>().obs;
  RxBool opt1 = RxBool(false);
  RxBool opt2 = RxBool(false);

  @override
  void onReady() {
    super.onReady();
    ever(patient, _updateForms);
  }

  _updateForms(Patient? patient) {
    formKey.value.currentState!.fields['name']!.didChange(patient?.name);
    formKey.value.currentState!.fields['address']!.didChange(patient?.address);
    formKey.value.currentState!.fields['number']!.didChange(patient?.number);
    formKey.value.currentState!.fields['dob']!.didChange(patient?.dob);
  }
}
