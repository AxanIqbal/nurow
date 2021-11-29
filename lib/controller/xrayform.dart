import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:nurow/models/patient.dart';

class XrayFormController extends GetxController {
  static XrayFormController instance = Get.find();
  Rxn<Patient?> patient = Rxn<Patient?>(null);
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void onReady() {
    super.onReady();
    ever(patient, _updateForms);
  }

  _updateForms(Patient? patient) {
    formKey.currentState!.fields['name']!.didChange(patient?.name);
    formKey.currentState!.fields['address']!.didChange(patient?.address);
    formKey.currentState!.fields['number']!.didChange(patient?.number);
    formKey.currentState!.fields['dob']!.didChange(patient?.dob);
  }
}
