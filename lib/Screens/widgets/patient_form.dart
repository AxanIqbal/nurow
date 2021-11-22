import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nurow/Screens/xray_view.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/locator.dart';
import 'package:nurow/models/patient.dart';

class PatientForm extends StatelessWidget {
  const PatientForm({
    Key? key,
    this.patient,
  }) : super(key: key);

  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 500,
              height: 400,
              child: FormBuilderImagePicker(
                name: 'originalImage',
                decoration: const InputDecoration(
                  labelText: 'Pick X-Ray',
                  border: InputBorder.none,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                ]),
                maxImages: 1,
                fit: BoxFit.fill,
                previewHeight: 400,
                previewWidth: 500,
              ),
            ),
          ),
          SizedBox(
            width: 400,
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  children: [
                    const TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text("Xray Type:"),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FormBuilderTextField(
                          name: 'xrayLabel',
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.minLength(context, 3),
                            ],
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("Patient Name:")),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FormBuilderTextField(
                        name: 'name',
                        enabled: patient == null,
                        initialValue: patient?.name,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.minLength(context, 3),
                          ],
                        ),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("Patient Address:")),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FormBuilderTextField(
                        name: 'address',
                        enabled: patient == null,
                        initialValue: patient?.address,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.minLength(context, 3),
                          ],
                        ),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text("Patient Number:"),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FormBuilderTextField(
                          name: 'number',
                          enabled: patient == null,
                          initialValue: patient?.number,
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.minLength(context, 3)
                            ],
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text("Patient Date Of Birth:")),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FormBuilderDateTimePicker(
                        name: 'dob',
                        enabled: patient == null,
                        initialValue: patient?.dob,
                        inputType: InputType.date,
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.saveAndValidate()) {
                log(_formKey.currentState!.value.toString());
                // _formKey.currentState!.value['dob'] =
                //     DateTime.parse(_formKey.currentState!.value['dob']);
                Patient data = Patient.fromJson({
                  ..._formKey.currentState!.value,
                  "xray": {
                    "xrayLabel": _formKey.currentState!.value['xrayLabel'],
                    "originalImage":
                        _formKey.currentState!.value['originalImage'],
                  }
                });
                debugPrint(data.xray.toString());
                // Get.to<NavigatorState>(() => XRayView(
                //       data: _formKey.currentState!.value,
                //     ));
                locator<NavigationService>().navigateToWidget(
                  () => XRayView(
                    data: data,
                    isNew: patient == null ? true : false,
                  ),
                );
              } else {
                debugPrint("validation failed");
                debugPrint(_formKey.currentState!.value.toString());
              }
            },
            child: const Text(
              "Next",
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
    );
  }
}