import 'package:flutter/material.dart';
import 'package:rentalz_app/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.6 - 10,
            color: kPrimaryColor,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height * 0.3 + 20,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      height: size.height * 0.3 + 70,
                      width: size.width * 0.7,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: size.height * 0.3,
                    width: size.width * 1,
                    child: Image.asset(
                      'assets/images/triangle.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.9 - 10,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 22),
                border: OutlineInputBorder(),
                hoverColor: Colors.amber,
                suffixIcon: Icon(
                  Icons.person_outlined,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.1 - 60,
          ),
          SizedBox(
            width: size.width * 0.9 - 10,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 22),
                border: OutlineInputBorder(),
                hoverColor: kSecondaryColor,
                suffixIcon: Icon(
                  Icons.visibility_outlined,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.1 - 50,
          ),
          ElevatedButton(
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.white))),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 150)),
            ),
          ),
          SizedBox(
            height: size.height * 0.1 - 70,
          ),
          TextButton(
            onPressed: () {},
            child: Text('Create new account', style: TextStyle()),
          ),
        ],
      ),
    );
  }
}
