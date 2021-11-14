import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rentalz_app/components/house_widget.dart';
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/model/house/house_controller.dart';
import 'package:rentalz_app/model/User/user_controller.dart';
import 'package:rentalz_app/screens/detail%20screen/house_detail.dart';
import 'package:rentalz_app/screens/login%20screen/login_screen.dart';
import 'package:path/path.dart';
import 'package:rentalz_app/screens/update%20screen/update_screen.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  HouseController houseController = Get.put(HouseController());
  UserController userController = Get.put(UserController());
  File? image;

  Future pickImage() async {
    try {
      final XFile? imagePick =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagePick != null) {
        print(imagePick);
        setState(() {
          image = File(imagePick.path);
        });
        String cutImage = image.toString().replaceAll('File: ', '');
        userController.updateImage(userController.userObj.value.id!,
            cutImage.substring(1, cutImage.length - 1));
      } else {
        return;
      }
      await saveImagePermanently(imagePick.path);
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
  void initState() {
    super.initState();
    houseController.findHouseById(userController.userObj.value.id!);
    userController.findUser(userController.userObj.value.id!);
    print(userController.userObj.value.image);
  }

  Future _onRefresh() async {
    houseController.findHouseById(userController.userObj.value.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.5,
                width: size.width,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.4,
                      width: size.width,
                      child: Image.asset(
                        'assets/images/profile_background.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        top: 50,
                        left: 20,
                        child: IconButton(
                          onPressed: () {
                            Get.to(LoginScreen());
                          },
                          icon: Icon(Icons.logout_outlined),
                          color: Colors.white,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 110),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: RichText(
                          text: TextSpan(
                              text: '${userController.userObj.value.name}\n',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text:
                                        'Contact: ${userController.userObj.value.email}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal)),
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 120,
                      bottom: 10,
                      child: GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: Container(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                maxRadius: 80,
                                backgroundImage: image == null
                                    ? userController.userObj.value.image == null
                                        ? AssetImage(
                                                'assets/images/avatar_user.jpg')
                                            as ImageProvider
                                        : FileImage(File(userController
                                            .userObj.value.image!))
                                    : FileImage(image!),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 10,
                                child: CircleAvatar(
                                  backgroundColor: kSecondaryColor,
                                  minRadius: 20,
                                  child: Icon(
                                    Icons.photo_camera,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.1 - 30,
                width: size.width * 0.6,
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Obx(() => Text(
                          '${houseController.findHouseByIdList.length} Post',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))),
              ),
              Obx(() {
                if (houseController.isFindHouseByIdLoading.value)
                  return Center(
                    heightFactor: 20,
                    child: CupertinoActivityIndicator(),
                  );
                else
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: houseController.findHouseByIdList.length,
                    itemBuilder: (context, index) {
                      var house = houseController.findHouseByIdList[index];
                      return houseController.findHouseByIdList.length == 0
                          ? Center(
                              child:
                                  Text('You have not posted any house before '),
                            )
                          : GestureDetector(
                              onTap: () {
                                Get.to(HouseDetail(
                                  name: house.name!,
                                  type: house.type!,
                                  city: house.city!,
                                  address: house.address!,
                                  furnitureType: house.furnitureType!,
                                  bedroom: house.bedroom!,
                                  toilet: house.toilet!,
                                  diningroom: house.diningroom!,
                                  image: house.image!,
                                  detail: house.detail!,
                                  userId: house.userId!,
                                  createdAt: house.createdAt!,
                                  price: house.price!,
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: size.height * 0.3 + 40,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: size.height * 0.3 - 40,
                                      width: size.width * 1,
                                      margin: EdgeInsets.only(
                                          top: 10, left: 10, right: 10),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: (house.image!.isEmpty)
                                              ? Image.asset(
                                                  'assets/images/no-image.png',
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.file(
                                                  File(house.image!.first),
                                                  width: 150,
                                                  fit: BoxFit.cover,
                                                )),
                                    ),
                                    Positioned(
                                        top: 12,
                                        right: 60,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(UpdateScreen(house: house));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.update_rounded,
                                              size: 28,
                                              color: kSecondaryColor,
                                            ),
                                          ),
                                        )),
                                    Positioned(
                                        top: 12,
                                        right: 15,
                                        child: GestureDetector(
                                          onTap: () {
                                            houseController
                                                .deleteHouse(house.id!)
                                                .then((value) => {
                                                      houseController
                                                          .findHouseByIdList
                                                          .removeAt(index),
                                                      Get.snackbar(
                                                        'Delete Successfull',
                                                        '${house.name} has deleted',
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor:
                                                            Colors.green[100],
                                                      ),
                                                    });
                                          },
                                          child: Icon(
                                            Icons.backspace_rounded,
                                            size: 28,
                                            color: Colors.red[300],
                                          ),
                                        )),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        height: 100,
                                        width: size.width * 1 - 20,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blueGrey
                                                  .withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 20,
                                              top: 10,
                                              child: Container(
                                                width: 250,
                                                child: Text(
                                                  house.name!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: kSecondaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 35,
                                              left: 15,
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                      radius: 15,
                                                      backgroundImage: userController
                                                                  .userObj
                                                                  .value
                                                                  .image !=
                                                              null
                                                          ? FileImage(File(
                                                              userController
                                                                  .userObj
                                                                  .value
                                                                  .image!))
                                                          : AssetImage(
                                                                  'assets/images/avatar_user.jpg')
                                                              as ImageProvider),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        user!.name!,
                                                        style: TextStyle(
                                                            color:
                                                                kSecondaryColor),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 22,
                                              right: 15,
                                              child: Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 90),
                                                  child: Text(
                                                    "\$ ${house.price} usd",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: kSecondaryColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ),
                                            Positioned(
                                              bottom: 10,
                                              left: 15,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: kSecondaryColor,
                                                  ),
                                                  Text(
                                                    house.type!,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: kSecondaryColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                                right: 25,
                                                bottom: 10,
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bed_outlined,
                                                      color: kSecondaryColor,
                                                      size: 20,
                                                    ),
                                                    Text(
                                                      '${house.bedroom} ',
                                                      style: TextStyle(
                                                          color:
                                                              kSecondaryColor),
                                                    ),
                                                    Icon(
                                                      Icons.bathtub_outlined,
                                                      color: kSecondaryColor,
                                                      size: 20,
                                                    ),
                                                    Text(
                                                      '${house.toilet}  ',
                                                      style: TextStyle(
                                                          color:
                                                              kSecondaryColor),
                                                    ),
                                                    Icon(
                                                      Icons.restaurant_outlined,
                                                      color: kSecondaryColor,
                                                      size: 20,
                                                    ),
                                                    Text(
                                                      '${house.diningroom}  ',
                                                      style: TextStyle(
                                                          color:
                                                              kSecondaryColor),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 25,
                                      left: 25,
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFFD9FFFFFF),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: kSecondaryColor,
                                              ),
                                              Text(
                                                house.city!,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: kSecondaryColor),
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
