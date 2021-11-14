import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/model/User/user_controller.dart';
import 'package:rentalz_app/model/User/user_model.dart';
import 'package:rentalz_app/model/house/house_controller.dart';
import 'package:rentalz_app/model/house/house_model.dart';

import 'package:rentalz_app/screens/detail%20screen/house_detail.dart';

class HouseWidget extends StatefulWidget {
  const HouseWidget({
    Key? key,
    required this.house,
    required this.size,
  }) : super(key: key);

  final House house;
  final Size size;

  @override
  State<HouseWidget> createState() => _HouseWidgetState();
}

HouseController houseController = Get.put(HouseController());
UserController userController = Get.put(UserController());
User? user;

class _HouseWidgetState extends State<HouseWidget> {
  @override
  void initState() {
    findUser(widget.house.userId!);
    super.initState();
  }

  findUser(int id) async {
    userController.findUser(id).then((value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(HouseDetail(
          name: widget.house.name!,
          type: widget.house.type!,
          city: widget.house.city!,
          address: widget.house.address!,
          furnitureType: widget.house.furnitureType!,
          bedroom: widget.house.bedroom!,
          toilet: widget.house.toilet!,
          diningroom: widget.house.diningroom!,
          image: widget.house.image!,
          detail: widget.house.detail!,
          userId: widget.house.userId!,
          createdAt: widget.house.createdAt!,
          price: widget.house.price!,
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: widget.size.height * 0.3 + 40,
        child: Stack(
          children: [
            Container(
              height: widget.size.height * 0.3 - 40,
              width: widget.size.width * 1,
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: (widget.house.image!.isEmpty)
                      ? Image.asset(
                          'assets/images/no-image.png',
                          fit: BoxFit.fill,
                        )
                      : Image.file(
                          File(widget.house.image!.first),
                          width: 150,
                          fit: BoxFit.cover,
                        )),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 100,
                width: widget.size.width * 1 - 20,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
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
                          widget.house.name!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 22,
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold),
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
                                          .userObj.value.image !=
                                      null
                                  ? FileImage(
                                      File(userController.userObj.value.image!))
                                  : AssetImage('assets/images/avatar_user.jpg')
                                      as ImageProvider),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                user!.name!,
                                style: TextStyle(color: kSecondaryColor),
                              )),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 22,
                      right: 15,
                      child: Padding(
                          padding: EdgeInsets.only(left: 90),
                          child: Text(
                            "\$ ${widget.house.price} usd",
                            style: TextStyle(
                                fontSize: 24,
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold),
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
                            widget.house.type!,
                            style:
                                TextStyle(fontSize: 14, color: kSecondaryColor),
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
                              '${widget.house.bedroom} ',
                              style: TextStyle(color: kSecondaryColor),
                            ),
                            Icon(
                              Icons.bathtub_outlined,
                              color: kSecondaryColor,
                              size: 20,
                            ),
                            Text(
                              '${widget.house.toilet}  ',
                              style: TextStyle(color: kSecondaryColor),
                            ),
                            Icon(
                              Icons.restaurant_outlined,
                              color: kSecondaryColor,
                              size: 20,
                            ),
                            Text(
                              '${widget.house.diningroom}  ',
                              style: TextStyle(color: kSecondaryColor),
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
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFD9FFFFFF),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: kSecondaryColor,
                      ),
                      Text(
                        widget.house.city!,
                        style: TextStyle(fontSize: 14, color: kSecondaryColor),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
