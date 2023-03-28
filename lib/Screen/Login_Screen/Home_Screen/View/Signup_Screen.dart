import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastexam/Screen/Login_Screen/Home_Screen/controller/Home_controller/Home_Controller.dart';
import 'package:lastexam/utils/helper_class/sherd/Shared_helper.dart';
import 'package:sizer/sizer.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({Key? key}) : super(key: key);

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
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
                      "Sign up ",
                      style: GoogleFonts.poppins(
                          fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "Create your",
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Text(
                    " Account",
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                  ),
                ],
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
                    controller: home_controller.txtSignemail.value,
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
                  controller: home_controller.txtSignpass.value,
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
                    hintText: "Enter Your Password",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              InkWell(
                onTap: () {
                  SheredHelper.sheredHelper.createShared(
                      email: home_controller.txtSignemail.value.text,
                      pass: home_controller.txtSignpass.value.text);
                  Get.offNamed('login');
                },
                child: Container(
                  height: 6.h,
                  width: 50.w,
                  alignment: Alignment.center,
                  child: Text(
                    "Sign up",
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
                      "Your Account is Created? ",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "Login",
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
