import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/widgets/custom_scaffold.dart';
import 'package:nurow/Screens/widgets/patient_table.dart';
import 'package:nurow/Screens/xray_view.dart';
import 'package:nurow/controller/xrayform.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/xray.dart';

class XRayForm extends GetView<XrayFormController> {
  const XRayForm({Key? key}) : super(key: key);

  // bool isNew = true;
  // Patient? patient;

  void handle(Patient patientX) {
    controller.patient.value = patientX;
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(XrayFormController());
    // final XrayFormController pt = Get.find();

    const _toothSelections = [
      "UL QUADRANT",
      "UR QUADRANT",
      "LL QUADRANT",
      "LR QUADRANT",
      "UPPER ANTERIOR REGION",
      "LOWER ANTERIOR REGION",
      "MANDIBULAR ARCH",
      "MAXILLARY ARCH",
      "UL1",
      "UL2",
      "UL3",
      "UL4",
      "UL5",
      "UL6",
      "UL7",
      "UL8",
      "UR1",
      "UR2",
      "UR3",
      "UR4",
      "UR5",
      "UR6",
      "UR7",
      "UR8",
      "LL1",
      "LL2",
      "LL3",
      "LL4",
      "LL5",
      "LL6",
      "LL7",
      "LL8",
      "LR1",
      "LR2",
      "LR3",
      "LR4",
      "LR5",
      "LR6",
      "LR7",
      "LR8",
    ];
    const _view = [
      "OCCLUSAL",
      "BUCCAL",
      "PALATAL/LINGUAL",
    ];

    return CustomScaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: FormBuilder(
                  key: controller.formKey.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
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
                                previewHeight:
                                    MediaQuery.of(context).size.height * 0.4,
                                previewWidth:
                                    MediaQuery.of(context).size.width * 0.4,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: FormBuilderImagePicker(
                                        name: 'optionalImage1',
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (value) {
                                          if (value?.isEmpty ?? false) {
                                            controller.opt1.value = false;
                                            if (controller.formKey.value
                                                        .currentState!.fields[
                                                    'ToothSelection1'] !=
                                                null) {
                                              controller
                                                  .formKey
                                                  .value
                                                  .currentState!
                                                  .fields['ToothSelection1']!
                                                  .reset();
                                            }
                                            if (controller
                                                    .formKey
                                                    .value
                                                    .currentState!
                                                    .fields['view1'] !=
                                                null) {
                                              controller
                                                  .formKey
                                                  .value
                                                  .currentState!
                                                  .fields['view1']!
                                                  .reset();
                                            }
                                          } else {
                                            controller.opt1.value = true;
                                          }
                                        },
                                        maxImages: 1,
                                        fit: BoxFit.fill,
                                        previewHeight:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        previewWidth:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                    ),
                                  ),
                                  // if (controller.formKey.value.currentState?.value['optionalImage1'] !=
                                  //         null ||
                                  //     controller.formKey.value.currentState?.value['optionalImage1']
                                  //         is List)
                                  Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: Obx(
                                          () => FormBuilderDropdown(
                                            name: 'ToothSelection1',
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                            hint: const Text('Tooth Selection'),
                                            items: List<DropdownMenuItem>.from(
                                              _toothSelections.map(
                                                (e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e),
                                                ),
                                              ),
                                            ),
                                            validator: controller.opt1.value
                                                ? FormBuilderValidators
                                                    .compose([
                                                    FormBuilderValidators
                                                        .required(
                                                      context,
                                                      errorText:
                                                          "Tooth Selection is Required",
                                                    ),
                                                  ])
                                                : null,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: Obx(
                                          () => FormBuilderDropdown(
                                            name: 'view1',
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: controller.opt1.value
                                                ? FormBuilderValidators
                                                    .compose([
                                                    FormBuilderValidators
                                                        .required(
                                                      context,
                                                      errorText:
                                                          "View is Required",
                                                    ),
                                                  ])
                                                : null,
                                            hint: const Text('View'),
                                            items: List<DropdownMenuItem>.from(
                                              _view.map(
                                                (e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: FormBuilderImagePicker(
                                        name: 'optionalImage2',
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        maxImages: 1,
                                        fit: BoxFit.fill,
                                        previewHeight:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        previewWidth:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        onChanged: (value) {
                                          if (value?.isEmpty ?? false) {
                                            controller.opt2.value = false;
                                            if (controller.formKey.value
                                                        .currentState!.fields[
                                                    'ToothSelection2'] !=
                                                null) {
                                              controller
                                                  .formKey
                                                  .value
                                                  .currentState!
                                                  .fields['ToothSelection2']!
                                                  .reset();
                                            }
                                            if (controller
                                                    .formKey
                                                    .value
                                                    .currentState!
                                                    .fields['view2'] !=
                                                null) {
                                              controller
                                                  .formKey
                                                  .value
                                                  .currentState!
                                                  .fields['view2']!
                                                  .reset();
                                            }
                                          } else {
                                            controller.opt2.value = true;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  // if (controller.formKey.value.currentState?.fields['optionalImage2'] !=
                                  //     null)
                                  Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: Obx(
                                          () => FormBuilderDropdown(
                                            name: 'ToothSelection2',
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                            hint: const Text('Tooth Selection'),
                                            validator: controller.opt2.value
                                                ? FormBuilderValidators
                                                    .compose([
                                                    FormBuilderValidators
                                                        .required(
                                                      context,
                                                      errorText:
                                                          "Tooth Selection is Required",
                                                    ),
                                                  ])
                                                : null,
                                            items: List<DropdownMenuItem>.from(
                                              _toothSelections.map(
                                                (e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: Obx(
                                          () => FormBuilderDropdown(
                                            name: 'view2',
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: controller.opt2.value
                                                ? FormBuilderValidators
                                                    .compose([
                                                    FormBuilderValidators
                                                        .required(
                                                      context,
                                                      errorText:
                                                          "View is Required",
                                                    ),
                                                  ])
                                                : null,
                                            hint: const Text('View'),
                                            items: List<DropdownMenuItem>.from(
                                              _view.map(
                                                (e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: FormBuilderTextField(
                                        name: 'xrayLabel',
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                                context),
                                            FormBuilderValidators.minLength(
                                                context, 3),
                                          ],
                                        ),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Obx(
                                      () => FormBuilderTextField(
                                        name: 'name',
                                        enabled:
                                            controller.patient.value == null,
                                        initialValue:
                                            controller.patient.value?.name,
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                                context),
                                            FormBuilderValidators.minLength(
                                                context, 3),
                                          ],
                                        ),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10),
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
                                      child: Text("Patient Address:")),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Obx(
                                      () => FormBuilderTextField(
                                        name: 'address',
                                        enabled:
                                            controller.patient.value == null,
                                        initialValue:
                                            controller.patient.value?.address,
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                                context),
                                            FormBuilderValidators.minLength(
                                                context, 3),
                                          ],
                                        ),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Obx(
                                        () => FormBuilderTextField(
                                          name: 'number',
                                          enabled:
                                              controller.patient.value == null,
                                          initialValue:
                                              controller.patient.value?.number,
                                          validator:
                                              FormBuilderValidators.compose(
                                            [
                                              FormBuilderValidators.required(
                                                  context),
                                              FormBuilderValidators.minLength(
                                                  context, 3)
                                            ],
                                          ),
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10),
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
                                      child: Text("Patient Date Of Birth:")),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Obx(
                                      () => FormBuilderDateTimePicker(
                                        name: 'dob',
                                        enabled:
                                            controller.patient.value == null,
                                        initialValue:
                                            controller.patient.value?.dob,
                                        inputType: InputType.date,
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context)
                                        ]),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10),
                                        ),
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
                          if (controller.formKey.value.currentState!
                              .saveAndValidate()) {
                            // controller.formKey.value.currentState!.value['dob'] =
                            //     DateTime.parse(controller.formKey.value.currentState!.value['dob']);
                            Xray currentXray = Xray(
                              originalImage: controller.formKey.value
                                  .currentState!.value['originalImage'][0].path,
                              radiographType: controller.formKey.value
                                  .currentState!.value['xrayLabel'],
                              timeStamp: DateTime.now(),
                              optionalImages: [],
                            );
                            if (controller.formKey.value.currentState!
                                        .value['optionalImage1'] !=
                                    null &&
                                controller.formKey.value.currentState!
                                        .value['ToothSelection1'] !=
                                    null &&
                                controller.formKey.value.currentState!
                                        .value['view1'] !=
                                    null) {
                              currentXray.optionalImages.add(
                                OptionalImages(
                                  toothSelections: controller.formKey.value
                                      .currentState!.value['ToothSelection1'],
                                  view: controller.formKey.value.currentState!
                                      .value['view1'],
                                  image: controller.formKey.value.currentState!
                                      .value['optionalImage1'][0].path,
                                ),
                              );
                            }
                            if (controller.formKey.value.currentState!
                                        .value['optionalImage2'] !=
                                    null &&
                                controller.formKey.value.currentState!
                                        .value['ToothSelection2'] !=
                                    null &&
                                controller.formKey.value.currentState!
                                        .value['view2'] !=
                                    null) {
                              currentXray.optionalImages.add(
                                OptionalImages(
                                  toothSelections: controller.formKey.value
                                      .currentState!.value['ToothSelection2'],
                                  view: controller.formKey.value.currentState!
                                      .value['view2'],
                                  image: controller.formKey.value.currentState!
                                      .value['optionalImage2'][0].path,
                                ),
                              );
                            }
                            Patient data;
                            if (controller.patient.value == null) {
                              data = Patient.fromJson({
                                ...controller.formKey.value.currentState!.value,
                              });
                              data.xray.add(currentXray);
                            } else {
                              controller.patient.value!.xray.add(
                                currentXray,
                              );
                              data = controller.patient.value!;
                            }
                            Get.to(
                              () => XRayView(
                                data: data,
                                currentXray: currentXray,
                                isNew: controller.patient.value == null,
                              ),
                            );
                          } else {
                            debugPrint("validation failed");
                            debugPrint(controller
                                .formKey.value.currentState!.value
                                .toString());
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.resolveWith<
                              EdgeInsetsGeometry>(
                            (Set<MaterialState> states) {
                              return EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              );
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    if (controller.patient.value == null) {
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
                      controller.patient.value = null;
                    }
                  },
                  child: Obx(
                    () => Text(controller.patient.value == null
                        ? 'Already exist?'
                        : 'Create new?'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
