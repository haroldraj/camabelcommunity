import 'package:camabelcommunity/constants/custom_colors.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: CustomColors.darkBlue,
    onPrimary: Colors.white,
    surface: CustomColors.darkBlue,
    onSurface: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: CustomColors.darkBlue,
    foregroundColor: CustomColors.white,
    iconTheme: IconThemeData(color: CustomColors.white),
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: CustomColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    centerTitle: false,
    elevation: 0,
  ),
);
