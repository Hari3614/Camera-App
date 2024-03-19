import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ui_designs/db/functions/db_functions.dart';
import 'package:ui_designs/screens/gallery.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                      children: [
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                 elevation: MaterialStateProperty.all<double>(15.0),
                ),
                  onPressed: () async {
                    final pickedImage =
                        await ImagePicker().pickImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      File img = File(pickedImage.path);
                      await insert(image: img.path);
                    }
                  },
                  child: const Text("Camera",style: TextStyle(
                    color: Colors.white
                  ))),
                  SizedBox(height: 20,),
              ElevatedButton(
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  elevation: MaterialStateProperty.all<double>(15.0), 
                 ),
                 
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GalleryScreen(),
                        ));
                  },
                  child: const Text('gallery',style: TextStyle(
                    color: Colors.white
                  ),)),
                      ],
                    ),
            ],
          )),
    );
  }
}
