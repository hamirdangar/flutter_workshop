
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFild extends StatelessWidget {
  final  controller;
  final String labelText;
  final bool obscureText;
  final prefixIcon;

  const MyTextFild({
    required this.controller,
    required this.labelText,
    required this.obscureText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
      child:  TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
