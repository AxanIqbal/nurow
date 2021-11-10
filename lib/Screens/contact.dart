import 'package:flutter/material.dart';

Widget dialogContact() {
  return Dialog(
    child: Container(
      padding: const EdgeInsets.all(15),
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Contact",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          contactText(),
          const SizedBox(
            height: 10,
          ),
          contactText(),
          const SizedBox(
            height: 10,
          ),
          contactText(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}

Widget contactText() {
  return const Text(
    "Email: example@eample.com",
    style: TextStyle(color: Colors.blue, fontSize: 16, fontFamily: "Poppins"),
  );
}
