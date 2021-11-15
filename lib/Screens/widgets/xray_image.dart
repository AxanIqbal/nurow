import 'package:flutter/material.dart';

Widget xRayImage(String image) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
      border: Border.all(color: Colors.blueAccent, width: 2),
    ),
    child: const SizedBox(
      height: 400,
      width: 500,
    ),
  );
}
