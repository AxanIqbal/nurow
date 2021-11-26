import 'package:flutter/material.dart';

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
        image: isAsset
            ? AssetImage(image)
            : NetworkImage(image) as ImageProvider<Object>,
        fit: BoxFit.fill,
      ),
      border: Border.all(color: Colors.blueAccent, width: 2),
    ),
    // child: SizedBox(
    //   height: imageHeight,
    //   width: imageWidth,
    // ),
  );
}
