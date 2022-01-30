import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/Substrative/controller/form_controller.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/xray.dart';

class MultiForm extends StatelessWidget {
  const MultiForm({
    Key? key,
    required this.formKey,
    required this.title,
    required this.onPress,
    this.radiograph,
  }) : super(key: key);

  final String title;
  final Rx<GlobalKey<FormBuilderState>> formKey;
  final void Function(Xray) onPress;
  final String? radiograph;

  @override
  Widget build(BuildContext context) {
    final controller = SubFormController.instance;

    return Container(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: FormBuilder(
          key: formKey.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: context.responsiveValue(
                    desktop: MediaQuery.of(context).size.width * 0.4,
                    tablet: MediaQuery.of(context).size.width * 0.5,
                    mobile: MediaQuery.of(context).size.width * 0.7,
                    watch: MediaQuery.of(context).size.width * 0.8,
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: FormBuilderImagePicker(
                    name: 'originalImage',
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    maxImages: 1,
                    fit: BoxFit.fill,
                    previewHeight: MediaQuery.of(context).size.height * 0.4,
                    previewWidth: context.responsiveValue(
                      desktop: MediaQuery.of(context).size.width * 0.4,
                      tablet: MediaQuery.of(context).size.width * 0.5,
                      mobile: MediaQuery.of(context).size.width * 0.7,
                      watch: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.responsiveValue(
                  desktop: MediaQuery.of(context).size.width * 0.4,
                  tablet: MediaQuery.of(context).size.width * 0.5,
                  mobile: MediaQuery.of(context).size.width * 0.75,
                  watch: MediaQuery.of(context).size.width * 0.8,
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 16,
                  ),
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
                            child: Text("Radiograph Type:"),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: FormBuilderTextField(
                                name: 'xrayLabel',
                                enabled: radiograph == null,
                                initialValue: radiograph,
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
                            child: Obx(
                              () => FormBuilderTextField(
                                name: 'name',
                                enabled: controller.patient.value == null,
                                initialValue: controller.patient.value?.name,
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
                              child: Text("Address:")),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Obx(
                              () => FormBuilderTextField(
                                name: 'address',
                                enabled: controller.patient.value == null,
                                initialValue: controller.patient.value?.address,
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
                            child: Text("Record Number:"),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Obx(
                                () => FormBuilderTextField(
                                  name: 'number',
                                  enabled: controller.patient.value == null,
                                  initialValue:
                                      controller.patient.value?.number,
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.required(context),
                                      FormBuilderValidators.minLength(
                                          context, 3)
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
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text("Date Of Birth:")),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Obx(
                              () => FormBuilderDateTimePicker(
                                name: 'dob',
                                enabled: controller.patient.value == null,
                                initialValue: controller.patient.value?.dob,
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
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text("Date of radiograph:")),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: FormBuilderDateTimePicker(
                              name: 'timeStamp',
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
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.value.currentState!.saveAndValidate()) {
                    Xray currentXray = Xray(
                      originalImage: formKey
                          .value.currentState!.value['originalImage'][0].path,
                      radiographType:
                          formKey.value.currentState!.value['xrayLabel'],
                      timeStamp: formKey.value.currentState!.value['timeStamp'],
                      optionalImages: [],
                    );
                    if (controller.isNew.value == true) {
                      controller.patient.value = Patient.fromJson({
                        ...formKey.value.currentState!.value,
                      });
                    }
                    // var _patient = patient ??
                    //     Patient.fromJson({
                    //       ...formKey.value.currentState!.value,
                    //     });
                    onPress(currentXray);
                  } else {
                    debugPrint("validation failed");
                    debugPrint(formKey.value.currentState!.value.toString());
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
                      return EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.02,
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
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
