import 'package:flutter/material.dart';
import 'package:ticketing_system/constants/colors.dart';

class CTextFieldTheme {
  CTextFieldTheme._(); // making it private so that it is not instantiable
  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    labelStyle: TextStyle(color: blackRussian),
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Colors.orange),
    ),
    prefixIconColor: orange,
    floatingLabelStyle: TextStyle(color: blackRussian),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: orange),
    ),
  );
}
