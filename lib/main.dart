import 'utils/value.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'screens/main/view/main_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Rounak",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: AppColors.black, elevation: 0),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.darkGrey,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(0xffb3b3b3),
          )),
      home: MainScreen(),
    );
  }
}
