import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentalz_app/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Exam extends StatefulWidget {
  Exam({Key? key}) : super(key: key);

  @override
  _ExamState createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  List<File?> image = [
    File(
        '/data/user/0/com.example.rentalz_app/app_flutter/image_picker2181151569161698202.jpg'),
  ];
  File? image2 = File(
      '/data/user/0/com.example.rentalz_app/app_flutter/image_picker2181151569161698202.jpg');

  Future pickImage(ImageSource source) async {
    try {
      final List<XFile>? image = await ImagePicker().pickMultiImage();
      if (image == null) return;

      // final imageTemporary = File(image.path);
      for (var img in image) {
        final imagePermanent = await saveImagePermanently(img.path);
        setState(() {
          this.image.add(imagePermanent);
          print('This is :$imagePermanent');
        });
      }
    } on PlatformException catch (e) {
      print('Fail to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              image != null
                  ? Container(
                      height: 500,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: image.length,
                          itemBuilder: (context, index) {
                            return Image.file(
                              image[index]!,
                              height: 150,
                              width: 150,
                            );
                          }),
                    )
                  : FlutterLogo(
                      size: 160,
                    ),
              ElevatedButton(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                child: Container(
                  height: 50,
                  width: 200,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                child: Container(
                  height: 50,
                  width: 200,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
