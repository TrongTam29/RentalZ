import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentalz_app/constants.dart';

class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/236x/d7/5d/22/d75d22e233d069059bb876ed36d1804c.jpg'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '  Timmy Bremer',
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
              Container(
                height: size.height * 0.7,
                child: ListView(
                  children: [
                    itemInList(size),
                    itemInList(size),
                    itemInList(size),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container itemInList(Size size) {
    return Container(
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
              child: Image.network(
                'https://i.pinimg.com/564x/0f/c7/cb/0fc7cbd44f594b1ed219cc3504094260.jpg',
                fit: BoxFit.fitWidth,
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
                      'Special house mix',
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
                              'Timmy Bremer',
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
                          "\$1500 usd",
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
                          'House',
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
                            '2  ',
                            style: TextStyle(color: kSecondaryColor),
                          ),
                          Icon(
                            Icons.bathtub_outlined,
                            color: kSecondaryColor,
                            size: 20,
                          ),
                          Text(
                            '2  ',
                            style: TextStyle(color: kSecondaryColor),
                          ),
                          Icon(
                            Icons.restaurant_outlined,
                            color: kSecondaryColor,
                            size: 20,
                          ),
                          Text(
                            '2  ',
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
                      'Los angeles, CA',
                      style: TextStyle(fontSize: 14, color: kSecondaryColor),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
