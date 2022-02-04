import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget xRayImage(String image,
    {double imageHeight = 400, double? imageWidth, bool isAsset = false}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeIn,
    padding: const EdgeInsets.all(10),
    height: imageHeight,
    width: imageWidth,
    decoration: BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        image: GetUtils.isURL(image) || GetUtils.hasMatch(image, 'blob:')
            ? NetworkImage(image)
            : GetPlatform.isMobile && image[0] == '/'
                ? FileImage(File(image))
                : AssetImage(image) as ImageProvider<Object>,
        fit: BoxFit.fill,
      ),
      border: Border.all(color: Colors.blueAccent, width: 2),
    ),
  );
}
