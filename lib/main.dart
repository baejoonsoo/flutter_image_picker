import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? _image;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.accents[2],
                ),
                onPressed: () {
                  getImage(ImageSource.camera);
                },
                child: const Text("Camera"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.accents[5],
                ),
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
                child: const Text("Gallery"),
              ),
              showImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget showImage() {
    if (_image == null) {
      return Container();
    } else {
      return Image.file(_image as File);
    }
  }

  Future getImage(ImageSource imageSource) async {
    var image = await ImagePicker().pickImage(source: imageSource);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
}
