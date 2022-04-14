import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/services/service.theme.dart';
import 'package:wrg3/frontend/pages/main/view.mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: themeService.lightTheme,
        // darkTheme: themeService.darkTheme,
        home: const MainPage());
  }
}
