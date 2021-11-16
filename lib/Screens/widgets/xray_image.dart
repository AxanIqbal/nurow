import 'package:flutter/material.dart';

Widget xRayImage(String image,
    {double imageHeight = 400, double imageWidth = 500}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
      border: Border.all(color: Colors.blueAccent, width: 2),
    ),
    child: SizedBox(
      height: imageHeight,
      width: imageWidth,
    ),
  );
}
