import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/Xray/xray_form.dart';
import 'package:nurow/Screens/widgets/patient_table.dart';
import 'package:nurow/Services/constants.dart';
import 'package:nurow/models/patient.dart';

class SelectImage extends GetResponsiveView {
  SelectImage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    var width = screen.width;
    var height = screen.height;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: screen.responsiveValue(
          desktop: width * 0.4,
          tablet: width * 0.6,
          mobile: width * 0.8,
        ),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: Image.network('https://i.ibb.co/bzyPjVc/X-Icon.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    showDialog(
                      context: screen.context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            color: Colors.grey[350],
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            child: PatientsTable(
                              patients: [patientDemo],
                              handle: (Patient patient) {
                                Get.dialog(
                                  Dialog(
                                    child: Container(
                                      color: Colors.grey[350],
                                      width: 400,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ...patient.xray.map(
                                            (e) => ListTile(
                                              title: Text(e.radiographType),
                                              onTap: () => Get.to(
                                                () => XRayForm(
                                                  patient: patient,
                                                  currentXray: e,
                                                ),
                                              ),
                                              leading: CircleAvatar(
                                                backgroundImage: GetUtils.isURL(
                                                            e.originalImage) ||
                                                        GetUtils.hasMatch(
                                                            e.originalImage,
                                                            'blob:')
                                                    ? NetworkImage(
                                                        e.originalImage)
                                                    : AssetImage(
                                                            e.originalImage)
                                                        as ImageProvider<
                                                            Object>,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Select X-Ray",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                            (Set<MaterialState> states) {
                      return EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.015,
                      );
                    }),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(screen.context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2);
                        }
                        return Colors.white; // Use the component's default.
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                TextButton(
                  onPressed: () => Get.to(() => const XRayForm()),
                  child: const Text(
                    "Upload X-Ray",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                            (Set<MaterialState> states) {
                      return EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.015,
                      );
                    }),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(screen.context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2);
                        }
                        return Colors.white; // Use the component's default.
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget gridImage(height, width, url, context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop(url);
    },
    child: Container(
      height: height * 0.17,
      width: width * 0.20,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 5),
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(url)),
      ),
    ),
  );
}

Widget selectedImage(height, width, url, context) {
  return Container(
    height: height * 0.20,
    width: width * 0.22,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blueAccent, width: 5),
      image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(url)),
    ),
  );
}
