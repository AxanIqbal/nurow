import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/widgets/patient_form.dart';
import 'package:nurow/Screens/widgets/patient_table.dart';
import 'package:nurow/models/patient.dart';

class XRayForm extends StatefulWidget {
  const XRayForm({Key? key}) : super(key: key);

  @override
  State<XRayForm> createState() => _XRayFormState();
}

class _XRayFormState extends State<XRayForm> {
  bool isNew = true;
  Patient patientY = Patient(
      name: 'name',
      dob: DateTime.now(),
      number: 'number',
      address: 'address',
      xray: []);

  void handle(Patient patientX) {
    patientY = patientX;
    Get.back();
    setState(() {
      isNew = !isNew;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  firstChild: const PatientForm(
                    key: ValueKey(1),
                  ),
                  secondChild: PatientForm(
                    key: const ValueKey(2),
                    patient: patientY,
                  ),
                  crossFadeState: isNew
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    if (isNew) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          child: Container(
                            color: Colors.grey[350],
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: PatientsTable(
                              handle: handle,
                            ),
                          ),
                        ),
                      );
                    } else {
                      setState(() {
                        isNew = !isNew;
                      });
                    }
                  },
                  child: Text(isNew ? 'Already exist?' : 'Create new?'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
