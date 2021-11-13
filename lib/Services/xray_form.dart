import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

dynamic xrayForm(BuildContext context) {
  final _formKey = GlobalKey<FormBuilderState>();
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        padding: const EdgeInsets.all(15),
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
              Column(
                children: [
                  FormBuilderTextField(
                    name: 'name',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 3),
                    ]),
                    decoration:
                        const InputDecoration(labelText: 'Patient Name'),
                  ),
                  FormBuilderTextField(
                    name: 'address',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 3),
                    ]),
                    decoration:
                        const InputDecoration(labelText: 'Patient Address'),
                  ),
                  FormBuilderTextField(
                    name: 'number',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 3)
                    ]),
                    decoration:
                        const InputDecoration(labelText: 'Patient Number'),
                  ),
                  FormBuilderDateTimePicker(
                    name: 'dob',
                    decoration: const InputDecoration(
                      labelText: 'Date Of Birth',
                    ),
                    inputType: InputType.date,
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    debugPrint(_formKey.currentState!.value.toString());
                  } else {
                    debugPrint("validation failed");
                    debugPrint(_formKey.currentState!.value.toString());
                  }
                },
                child: const Text("Next"),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
