import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class Time_Screen extends StatefulWidget {
  const Time_Screen({Key? key}) : super(key: key);

  @override
  State<Time_Screen> createState() => _Time_ScreenState();
}

class _Time_ScreenState extends State<Time_Screen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Get.offNamed('login');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h),
          child: Stack(
            children: [
              Container(
                height: 50.h,
                width: 60.w,
                alignment: Alignment.center,
                child: Lottie.asset("assets/lottie/welcome.json"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h, left: 15.w),
                child: Text(
                  "Wel come",
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
