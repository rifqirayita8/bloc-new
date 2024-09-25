import 'package:flutter/material.dart';

Widget customTextField({
  required String hintText,
  required TextEditingController controller,
  bool isObscure= false,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ), 
    ),
  );
}