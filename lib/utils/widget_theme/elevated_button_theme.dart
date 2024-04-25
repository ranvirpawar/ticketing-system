import 'package:flutter/material.dart';
import 'package:ticketing_system/constants/colors.dart';

class elevatedButtonTheme {
  static final elevatdButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: orange,
      // elevation: 0,
      backgroundColor: blackRussian,
      side: const BorderSide(
        color: fadedPurple,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
    ),
  );
}
