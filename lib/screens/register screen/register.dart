import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalz_app/model/User/user_controller.dart';
import 'package:rentalz_app/screens/home%20screen/home_screen.dart';
import 'package:rentalz_app/screens/login%20screen/login_screen.dart';

import '../../constants.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
UserController userController = Get.put(UserController());
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool passwordVisible = false;

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.6 - 50,
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
                          'assets/images/register_triangle.png',
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
                  controller: nameController,
                  validator: (val) =>
                      val!.isEmpty ? "Please input your name" : null,
                  decoration: InputDecoration(
                    labelText: 'Name',
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
                  validator: (val) {
                    if (val!.isNotEmpty) {
                      if (!val.contains("@")) {
                        return "Enter a valid email";
                      }
                    } else
                      return "Please input your email !";
                  },
                  controller: emailController,
                  decoration: InputDecoration(
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
                  validator: (val) =>
                      val!.isEmpty ? "Please input your password" : null,
                  controller: passwordController,
                  obscureText: !passwordVisible,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                    hoverColor: kSecondaryColor,
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
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
                  'Sign up',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  userController
                      .register(nameController.text, emailController.text,
                          passwordController.text)
                      .then((value) {
                    if (value == true) {
                      Get.to(LoginScreen());
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.white))),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 150)),
                ),
              ),
              SizedBox(
                height: size.height * 0.1 - 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
