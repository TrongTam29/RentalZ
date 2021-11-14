import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalz_app/components/house_widget.dart';
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/model/User/user_controller.dart';
import 'package:rentalz_app/model/User/user_model.dart';
import 'package:rentalz_app/model/house/house_controller.dart';

class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HouseController houseController = Get.put(HouseController());
  UserController userController = Get.put(UserController());
  User? user;
  @override
  void initState() {
    super.initState();
    print('User is ${userController.userObj.value.email}');
    houseController.fetchHouse();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: size.height * 0.1,
                width: size.width,
                child: Image.asset(
                  'assets/images/logo_in_home.png',
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            userController.userObj.value.image != null
                                ? FileImage(
                                    File(userController.userObj.value.image!))
                                : AssetImage('assets/images/avatar_user.jpg')
                                    as ImageProvider),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '  ${userController.userObj.value.name}',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xB3195583),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.1 - 70,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                margin: EdgeInsets.only(bottom: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Start looking for your house',
                        style:
                            TextStyle(color: kSecondaryColor, fontSize: 24))),
              ),
              Image.asset('assets/images/search.png'),
              Obx(() {
                if (houseController.isLoading.value)
                  return Center(
                    heightFactor: 20,
                    child: CupertinoActivityIndicator(),
                  );
                else
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: houseController.houseList.length,
                    itemBuilder: (context, index) {
                      var house = houseController.houseList[index];

                      return HouseWidget(
                        house: house,
                        size: size,
                      );
                    },
                  );
              })
            ],
          ),
        ),
      ),
    );
  }
}
