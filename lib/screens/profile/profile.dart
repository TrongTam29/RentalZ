import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalz_app/components/house_widget.dart';
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/model/house/house_controller.dart';
import 'package:rentalz_app/model/User/user_controller.dart';
import 'package:rentalz_app/screens/login%20screen/login_screen.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  HouseController houseController = Get.put(HouseController());
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    houseController.findHouseById(userController.userObj.value.id!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                    child: Image.network(
                      'https://i.pinimg.com/564x/3f/e2/9b/3fe29b178e7934de15580e943da0e53b.jpg',
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
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/236x/d7/5d/22/d75d22e233d069059bb876ed36d1804c.jpg'),
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
                  child: Text(
                '${houseController.findHouseByIdList.length} Post',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
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
                        : HouseWidget(house: house, size: size);
                  },
                );
            }),
          ],
        ),
      ),
    );
  }
}
