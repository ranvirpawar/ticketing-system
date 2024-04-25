import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ticketing_system/utils/widget_theme/elevated_button_theme.dart';
import 'package:ticketing_system/utils/widget_theme/icon_them.dart';
import 'package:ticketing_system/utils/widget_theme/textfield_style.dart';

class AppTheme {
  AppTheme._(); // making it private so that it is not instantiable
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: GoogleFonts.montserratTextTheme(),
    elevatedButtonTheme: elevatedButtonTheme.elevatdButtonTheme,
    iconTheme: AppIconTheme.lightIconTheme,
    inputDecorationTheme: CTextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData();
}
