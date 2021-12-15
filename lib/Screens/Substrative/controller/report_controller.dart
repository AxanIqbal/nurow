import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubReportController extends GetxController {
  RxInt index = 0.obs;
  Rx<ImageProvider<Object>> image =
      Rx<ImageProvider<Object>>(const AssetImage('assets/subtractive.png'));

  void changeImage(ImageProvider<Object> image1, int index1) {
    image.value = image1;
    index.value = index1;
  }
}
