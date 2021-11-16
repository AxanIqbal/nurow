import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nurow/Screens/xray_view.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/models/xray.dart';

import '../locator.dart';

class XRayForm extends StatelessWidget {
  const XRayForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: FormBuilder(
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
                      name: 'image',
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
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text("Xray Type:"),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: FormBuilderTextField(
                                name: 'type',
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.minLength(context, 3),
                                  ],
                                ),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text("Patient Name:")),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: FormBuilderTextField(
                              name: 'name',
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(context),
                                  FormBuilderValidators.minLength(context, 3),
                                ],
                              ),
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text("Patient Address:")),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: FormBuilderTextField(
                              name: 'address',
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(context),
                                  FormBuilderValidators.minLength(context, 3),
                                ],
                              ),
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text("Patient Number:"),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: FormBuilderTextField(
                                name: 'number',
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.minLength(context, 3)
                                  ],
                                ),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text("Patient Date Of Birth:")),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: FormBuilderDateTimePicker(
                              name: 'dob',
                              inputType: InputType.date,
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
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
                      Xray data = Xray.fromJson(_formKey.currentState!.value);
                      // debugPrint(
                      //     _formKey.currentState!.value['image'].toString());
                      // Get.to<NavigatorState>(() => XRayView(
                      //       data: _formKey.currentState!.value,
                      //     ));
                      locator<NavigationService>().navigateToWidget(
                        () => XRayView(data: data),
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
            ),
          ),
        ),
      ),
    );
  }
}
