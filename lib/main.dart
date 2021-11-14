import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/screens/detail%20screen/house_detail.dart';
import 'package:rentalz_app/screens/input%20screen/components/image_picker.dart';
import 'package:rentalz_app/screens/home%20screen/components/home.dart';
import 'package:rentalz_app/screens/home%20screen/home_screen.dart';
import 'package:rentalz_app/screens/input%20screen/input_screen.dart';
import 'package:rentalz_app/screens/login%20screen/login_screen.dart';
import 'package:rentalz_app/screens/profile/profile.dart';
import 'package:rentalz_app/screens/register%20screen/register.dart';
import 'package:rentalz_app/screens/search%20screen/search_screen.dart';
import 'package:rentalz_app/screens/update%20screen/update_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RentalZ',
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: LoginScreen());
  }
}
