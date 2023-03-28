import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lastexam/Screen/Db_App/dbScreen_page/View/db_homeScreen.dart';
import 'package:lastexam/Screen/Login_Screen/Home_Screen/View/Login_Screen.dart';
import 'package:lastexam/Screen/Login_Screen/Home_Screen/View/Signup_Screen.dart';
import 'package:lastexam/Screen/Login_Screen/Time_Screen/View/Time.dart';
import 'package:lastexam/Screen/news_app/view/Home_Page.dart';
import 'package:lastexam/Screen/news_app/view/Second_Page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (p0) => Time_Screen(),
            'login': (p0) => Login_Screen(),
            'Sign': (p0) => Signup_Screen(),
            'news1':(p0) => HomePage(),
            'news2':(p0) => HomePage2(),
            'data':(p0) => dh_HomeScreen(),
          },
        );
      },
    ),
  );
}
