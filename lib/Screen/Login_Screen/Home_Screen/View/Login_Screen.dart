import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastexam/Screen/Login_Screen/Home_Screen/controller/Home_controller/Home_Controller.dart';
import 'package:lastexam/utils/helper_class/sherd/Shared_helper.dart';
import 'package:sizer/sizer.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  Home_controller home_controller = Get.put(Home_controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 10.w),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 25.h),
                child: Text(
                  "Your Account",
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Name";
                      }
                    },
                    controller: home_controller.txtloginemail.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey.shade200,
                        size: 20,
                      ),
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 20,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 25,
                      ),
                      border: InputBorder.none,
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Name";
                    }
                  },
                  controller: home_controller.txtloginpass.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.grey.shade200,
                      size: 20,
                    ),
                    suffixIcon: Icon(
                      Icons.password,
                      color: Colors.black,
                      size: 20,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 25,
                    ),
                    border: InputBorder.none,
                    hintText: "Enter Your password",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              InkWell(
                onTap: () {
                  SheredHelper.sheredHelper.readdata();
                  Get.offNamed('news1');
                },
                child: Container(
                  height: 6.h,
                  width: 50.w,
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style:
                        GoogleFonts.poppins(fontSize: 25, color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h, left: 20.w),
                child: Row(
                  children: [
                    Text(
                      "Create your Account? ",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Get.offNamed('Sign');
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
