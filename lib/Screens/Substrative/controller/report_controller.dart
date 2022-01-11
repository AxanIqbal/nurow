import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubReportController extends GetxController {
  RxInt index = 0.obs;
  RxString image = RxString('assets/subtractive.png');

  void changeImage(String image1, int index1) {
    image.value = image1;
    index.value = index1;
  }
}
