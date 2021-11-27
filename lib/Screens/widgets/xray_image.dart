import 'package:flutter/material.dart';

Widget xRayImage(ImageProvider<Object> image,
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
        image: image,
        fit: BoxFit.fill,
      ),
      border: Border.all(color: Colors.blueAccent, width: 2),
    ),
  );
}
