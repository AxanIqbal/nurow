import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/xray.dart';

class SubFormController extends GetxController {
  static SubFormController instance = Get.find();
  Rxn<Patient?> patient = Rxn<Patient?>(null);
  final formKey = GlobalKey<FormBuilderState>().obs;
  final formKey2 = GlobalKey<FormBuilderState>().obs;
  RxBool first = RxBool(true);
  Rxn<Xray> xray1 = Rxn<Xray>();

  @override
  void onClose() {
    super.onClose();
    patient.value = null;
  }

  @override
  void onReady() {
    super.onReady();
    ever(patient, _updateForms);
  }

  _updateForms(Patient? patient) {
    formKey.value.currentState?.fields['name']?.didChange(patient?.name);
    formKey.value.currentState?.fields['address']?.didChange(patient?.address);
    formKey.value.currentState?.fields['number']?.didChange(patient?.number);
    formKey.value.currentState?.fields['dob']?.didChange(patient?.dob);
    formKey2.value.currentState?.fields['name']?.didChange(patient?.name);
    formKey2.value.currentState?.fields['address']?.didChange(patient?.address);
    formKey2.value.currentState?.fields['number']?.didChange(patient?.number);
    formKey2.value.currentState?.fields['dob']?.didChange(patient?.dob);
  }
}
