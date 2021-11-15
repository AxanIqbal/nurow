import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/models/xray.dart';

class XRayAnalyse extends StatelessWidget {
  const XRayAnalyse({Key? key, required this.xray}) : super(key: key);

  final Xray xray;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                xRayImage(xray.image.path),
                Expanded(child: xRayTable(xray)),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Identified 8 teeth and all boxed",
                          ),
                          Text("UL8 identified enamel .."),
                          Text("UL8 identified nerve ..."),
                          Divider(),
                          Divider(),
                          Text("Diagnostics")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Stop Analyse",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                  (Set<MaterialState> states) {
                    return const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    );
                  },
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
