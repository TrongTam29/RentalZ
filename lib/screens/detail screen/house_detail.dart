import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalz_app/constants.dart';
import 'package:intl/intl.dart';

class HouseDetail extends StatefulWidget {
  HouseDetail(
      {Key? key,
      required this.name,
      required this.type,
      required this.city,
      required this.address,
      required this.furnitureType,
      required this.bedroom,
      required this.toilet,
      required this.diningroom,
      required this.image,
      required this.userId,
      required this.detail,
      required this.createdAt,
      required this.price})
      : super(key: key);

  final String name;
  final String price;
  final String type;
  final String city;
  final String address;
  final String furnitureType;
  final int bedroom;
  final int toilet;
  final int diningroom;
  final List<String> image;
  final String detail;
  final DateTime createdAt;
  final int userId;

  @override
  _HouseDetailState createState() => _HouseDetailState();
}

class _HouseDetailState extends State<HouseDetail> {
  String? createAt;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  @override
  void initState() {
    super.initState();
    parseDatetime();
  }

  parseDatetime() {
    DateFormat formatter = DateFormat('MM-dd-yyyy');
    setState(() {
      createAt = formatter.format(widget.createdAt);
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    height: size.height * 0.4,
                    initialPage: 0,
                    autoPlay: false,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: widget.image
                    .map((item) => Container(
                          child: Image.file(
                            File(item),
                            width: size.width,
                            height: size.height,
                            fit: BoxFit.cover,
                          ),
                        ))
                    .toList(),
              ),
              Positioned(
                top: 280,
                left: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.image.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: size.width * 0.1 - 25,
                        height: size.height * 0.1 - 75,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key
                                ? kPrimaryColor
                                : Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kBackgroundColor),
                      child: Icon(Icons.chevron_left_rounded,
                          color: kSecondaryColor, size: 28)),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: size.height * 0.6 + 30,
                  width: size.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: kBackgroundColor,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 140,
                        left: 15,
                        child: Container(
                          width: size.width,
                          child: ListTile(
                            minLeadingWidth: 0,
                            leading: Icon(
                              Icons.location_on_outlined,
                              color: kSecondaryColor,
                            ),
                            title: Text(
                              ' ${widget.address}, \n${widget.city}',
                              style: TextStyle(
                                  fontSize: 14, color: kSecondaryColor),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 20,
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 24,
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 190,
                        right: 20,
                        child: Text(
                          'Posted on $createAt',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFA7A7A8),
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 15,
                        child: Container(
                          padding: EdgeInsets.only(left: 20, top: 15),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/236x/d7/5d/22/d75d22e233d069059bb876ed36d1804c.jpg'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 25,
                        child: Row(
                          children: [
                            Text(
                              widget.type,
                              style: TextStyle(color: Color(0xFFA7A7A8)),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kPrimaryColor,
                              ),
                            ),
                            Text(
                              widget.furnitureType,
                              style: TextStyle(color: Color(0xFFA7A7A8)),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kPrimaryColor,
                              ),
                            ),
                            Text(
                              'Centre - Ville',
                              style: TextStyle(color: Color(0xFFA7A7A8)),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 25,
                        child: Row(
                          children: [
                            Icon(
                              Icons.bed_outlined,
                              color: Color(0xFFBF6DD2D2),
                              size: 25,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, left: 5),
                              child: Text(
                                '${widget.bedroom}  ',
                                style: TextStyle(
                                    color: Color(0xFFA7A7A8), fontSize: 16),
                              ),
                            ),
                            Icon(
                              Icons.bathtub_outlined,
                              color: Color(0xFFBF6DD2D2),
                              size: 25,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, left: 5),
                              child: Text(
                                '${widget.toilet}  ',
                                style: TextStyle(
                                    color: Color(0xFFA7A7A8), fontSize: 16),
                              ),
                            ),
                            Icon(
                              Icons.restaurant_outlined,
                              color: Color(0xFFBF6DD2D2),
                              size: 25,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, left: 5),
                              child: Text(
                                '${widget.diningroom}  ',
                                style: TextStyle(
                                    color: Color(0xFFA7A7A8), fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 200),
                        child: Column(
                          children: [
                            Divider(
                              thickness: 1.5,
                              color: Color(0xFFA6C4C4C6),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: kSecondaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1.5,
                              color: Color(0xFFA6C4C4C6),
                            ),
                            Text(widget.detail),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Text(
                "\$ ${widget.price} usd",
                style: TextStyle(
                    fontSize: 24,
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Reserved now',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFBF6DD2D2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
