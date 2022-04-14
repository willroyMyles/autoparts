import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  ThemeData get _theme => ThemeData(
      scaffoldBackgroundColor: shadowGrey,
      backgroundColor: Colors.red,
      canvasColor: Colors.red,
      appBarTheme: AppBarTheme(
          backgroundColor: bgColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: fontColor),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Colors.red, primaryContainer: grey));

  Color get grey => Color.fromRGBO(240, 240, 240, 1);
  Color get shadowGrey => Color.fromRGBO(245, 245, 245, 1);
  Color get fontColor => Get.isDarkMode ? Colors.white : Colors.black;
  Color get bgColor => Get.isDarkMode ? Colors.black : Colors.white;
  BoxShadow get primaryShadow =>
      BoxShadow(blurRadius: 4, color: shadowGrey, spreadRadius: 2);
  BorderRadius get br => BorderRadius.circular(5);

  ThemeData get lightTheme => _theme.copyWith(
        brightness: Brightness.light,
      );
  ThemeData get darkTheme => _theme.copyWith(brightness: Brightness.dark);
}

ThemeService _themeService = ThemeService();
ThemeService get themeService => _themeService;
