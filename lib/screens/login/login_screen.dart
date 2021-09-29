import 'package:flutter/material.dart';
import 'package:rentalz_app/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: kPrimaryColor, shape: BoxShape.circle),
            height: 500,
          ),
          // CustomPaint(

          //   size: Size(300, 300),
          //   painter: PaintTriangle(backgroundColor: Colors.blue),
          // ),
        ],
      ),
    );
  }
}
