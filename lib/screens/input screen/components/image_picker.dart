import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class PickImage extends StatefulWidget {
  PickImage({Key? key}) : super(key: key);

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  List<File?> image = [];

  Future pickImage() async {
    try {
      final List<XFile>? image = await ImagePicker().pickMultiImage();
      if (image == null) return;

      for (var img in image) {
        print(img);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image.length != 0
                ? Container(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: image.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.file(
                                    File(
                                        '/data/user/0/com.example.rentalz_app/app_flutter/image_picker7440357289632883835.jpg'),
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () => {image.removeAt(index)},
                                  child: Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey[100],
                                    ),
                                    child: Icon(
                                      Icons.delete_outlined,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  )
                : GestureDetector(
                    onTap: pickImage,
                    child: Center(
                      child: Image.network(
                        'https://static.thenounproject.com/png/104062-200.png',
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
