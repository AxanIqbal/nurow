import 'package:flutter/material.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/Screens/xray_analyse.dart';
import 'package:nurow/Services/database.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/models/patient.dart';

import '../locator.dart';

class XRayView extends StatelessWidget {
  const XRayView({
    Key? key,
    required this.data,
    this.isNew = true,
  }) : super(key: key);

  final Patient data;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(child: xRayImage(data.xray[0]!.originalImage.path)),
            SizedBox(
              width: 400,
              child: xRayTable(data),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => locator<NavigationService>().goBack(),
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding:
                        MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
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
                ElevatedButton(
                  onPressed: () async {
                    if (isNew) {
                      await DataService().addPatient(data.toJson());
                    }
                    locator<NavigationService>().navigateToWidget(
                      () => XRayAnalyse(
                        patient: data,
                      ),
                    );
                  },
                  child: const Text(
                    "Analyse",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding:
                        MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
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
            )
          ],
        ),
      ),
    );
  }
}
