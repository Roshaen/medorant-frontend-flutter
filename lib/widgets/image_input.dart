import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput(this.onSelectImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = File(imageFile!.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    print("hek");
    print(appDir);
    final fileName = path.basename(imageFile!.path);
    final savedImage = await _storedImage?.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: _storedImage != null
            ? Image.file(
                _storedImage!,
                fit: BoxFit.cover,
                width: double.infinity,
              )
            : const Text(
                "No image taken!",
                textAlign: TextAlign.center,
              ),
        alignment: Alignment.center,
      ),
      Expanded(
        child: FlatButton.icon(
          icon: const Icon(Icons.camera),
          label: const Text("Take Picture"),
          textColor: Theme.of(context).primaryColor,
          onPressed: _takePicture,
        ),
      )
    ]);
  }
}
