import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nurow/Screens/widgets/xray_image.dart';
import 'package:nurow/Screens/widgets/xray_table.dart';
import 'package:nurow/Screens/xray_analyse.dart';
import 'package:nurow/Services/database.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/locator.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/xray.dart';

class XRayView extends StatelessWidget {
  const XRayView({
    Key? key,
    required this.data,
    this.isNew = true,
    required this.currentXray,
  }) : super(key: key);

  final Patient data;
  final bool isNew;
  final Xray currentXray;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: xRayImage(
                NetworkImage(currentXray.originalImage),
                imageHeight: MediaQuery.of(context).size.height * 0.5,
                imageWidth: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: XRayTable(
                data: data,
                currentXray: currentXray,
              ),
            ),
            const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
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
                _Button(
                  currentXray: currentXray,
                  isNew: isNew,
                  data: data,
                ),
                const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Button extends StatefulWidget {
  const _Button(
      {Key? key,
      required this.isNew,
      required this.data,
      required this.currentXray})
      : super(key: key);

  final bool isNew;
  final Patient data;
  final Xray currentXray;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isLoading
          ? () async {
              FirebaseStorage storage = FirebaseStorage.instance;
              setState(() {
                isLoading = true;
              });
              if (widget.isNew) {
                Patient? _x =
                    await DataService().addPatient(widget.data.toJson());
                if (_x != null) {
                  widget.data.id = _x.id;
                }
              }
              Reference _ref = storage
                  .ref()
                  .child('xrays')
                  .child(widget.data.id ?? 'dumped')
                  .child("${DateTime.now().toString()}.png");
              Response bytes =
                  await get(Uri.parse(widget.currentXray.originalImage));
              UploadTask _task = _ref.putData(bytes.bodyBytes);
              String _img = await (await _task).ref.getDownloadURL();
              await DataService().addXray({
                ...widget.currentXray.toJson(),
                "originalImage": _img,
                "patientId": widget.data.id,
              });
              setState(() {
                isLoading = false;
              });
              locator<NavigationService>().navigateToWidget(
                () => XRayAnalyse(
                  patient: widget.data,
                  currentXray: widget.currentXray,
                ),
              );
            }
          : null,
      child: !isLoading
          ? const Text(
              "Analyse",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )
          : const CircularProgressIndicator(
              color: Colors.black,
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
    );
  }
}
