import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/model/User/user_controller.dart';
import 'package:rentalz_app/screens/home%20screen/home_screen.dart';
import 'package:rentalz_app/screens/register%20screen/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool passwordVisible = false;
bool erorrCheck = false;
UserController userController = Get.put(UserController());
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
GlobalKey<FormState> formkey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  // @override
  // void dispose() {
  //   super.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
              height: size.height * 0.1 - 30,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  errorText: erorrCheck ? 'Email or Password not match' : null,
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(),
                  hoverColor: Colors.amber,
                  suffixIcon: Icon(
                    Icons.person_outlined,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1 - 70,
            ),
            SizedBox(
              width: size.width * 0.9 - 10,
              height: size.height * 0.1 - 30,
              child: TextFormField(
                controller: passwordController,
                obscureText: !passwordVisible,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  errorText: erorrCheck ? 'Email or Password not match' : null,
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(),
                  hoverColor: kSecondaryColor,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
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
              onPressed: () {
                userController
                    .login(emailController.text, passwordController.text)
                    .then((value) {
                  if (value!) {
                    Get.off(HomeScreen());
                    setState(() {
                      erorrCheck = false;
                    });
                  } else {
                    setState(() {
                      erorrCheck = true;
                    });
                  }
                });
                passwordController.clear();
              },
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
              onPressed: () {
                Get.to(Register());
              },
              child: Text('Create new account', style: TextStyle()),
            ),
          ],
        ),
      ),
    );
  }
}
