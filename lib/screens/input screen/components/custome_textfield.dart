import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 1,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Container(
        height: 40,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: text,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
