

import 'package:flutter/material.dart';

import 'palette.dart';

class MyMaterialTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    colorSchemeSeed: Palette.kPrimary,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Palette.kPrimary,
      centerTitle: true,
    )
  );

  // static final ThemeData darkTheme = ThemeData(
  //   useMaterial3: true,
  //   colorSchemeSeed: Palette.kToDark,
  //   brightness: Brightness.dark,
  // );
}