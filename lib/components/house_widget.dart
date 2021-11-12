import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/model/house/house_model.dart';

import 'package:rentalz_app/screens/detail%20screen/house_detail.dart';

class HouseWidget extends StatelessWidget {
  const HouseWidget({
    Key? key,
    required this.house,
    required this.size,
  }) : super(key: key);

  final House house;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  File(house.image!.first),
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 100,
                width: size.width * 1 - 20,
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
                      child: Text(
                        house.name!,
                        style: TextStyle(
                            fontSize: 22,
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: 15,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/236x/d7/5d/22/d75d22e233d069059bb876ed36d1804c.jpg'),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "user!.name!",
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
                            "\$ ${house.price} usd",
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
                            house.type!,
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
                              '${house.bedroom} ',
                              style: TextStyle(color: kSecondaryColor),
                            ),
                            Icon(
                              Icons.bathtub_outlined,
                              color: kSecondaryColor,
                              size: 20,
                            ),
                            Text(
                              '${house.toilet}  ',
                              style: TextStyle(color: kSecondaryColor),
                            ),
                            Icon(
                              Icons.restaurant_outlined,
                              color: kSecondaryColor,
                              size: 20,
                            ),
                            Text(
                              '${house.diningroom}  ',
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
                        house.city!,
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
