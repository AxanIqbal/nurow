import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormImagePicker extends StatefulWidget {
  const FormImagePicker({Key? key, required this.imagePickFunc})
      : super(key: key);
  final void Function(File pickedImage) imagePickFunc;

  @override
  _FormImagePickerState createState() => _FormImagePickerState();
}

class _FormImagePickerState extends State<FormImagePicker> {
  File? _pickedImage;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    var _pickedImageFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = File(_pickedImageFile!.path);
    });
    widget.imagePickFunc(_pickedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CircleAvatar(
        //   radius: 40,
        //   backgroundImage: _pickedImage != null
        //       ? (kIsWeb
        //           ? NetworkImage(_pickedImage!.path)
        //           : FileImage(File(_pickedImage!.path))
        //               as ImageProvider<Object>)
        //       : null,
        // ),
        if (_pickedImage == null)
          const SizedBox(
            height: 400,
            width: 500,
          )
        else
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: (kIsWeb
                      ? NetworkImage(_pickedImage!.path)
                      : FileImage(File(_pickedImage!.path))
                          as ImageProvider<Object>),
                  fit: BoxFit.fill),
            ),
            child: const SizedBox(
              height: 400,
              width: 500,
            ),
          ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: const Text("Add Image"),
        )
      ],
    );
  }
}
