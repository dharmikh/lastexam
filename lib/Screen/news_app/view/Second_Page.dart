import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lastexam/Screen/Db_App/dbScreen_page/controller/Db_controller.dart';
import 'package:lastexam/Screen/news_app/News_controller/News_controller.dart';
import 'package:lastexam/utils/helper_class/Database/Db_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  News_Controller news_controller = Get.put(News_Controller());
  Db_controller db_controller = Get.put(Db_controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "${news_controller.articles!.title}",
            maxLines: 1,
            style: GoogleFonts.robotoCondensed(
              fontSize: 25,
              textStyle: TextStyle(overflow: TextOverflow.ellipsis),
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    height: 40.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Image.network(
                      "${news_controller.articles!.urlToImage}",
                      fit: BoxFit.fill,
                    )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "${news_controller.articles!.description}",
                  maxLines: 8,
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 25,
                      textStyle: TextStyle(overflow: TextOverflow.ellipsis)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  DBHelper.dbHelper.insertDB(
                      dis: "${news_controller.articles!.description}",
                      image: "${news_controller.articles!.urlToImage}");
                  db_controller.getdata();
                  Get.toNamed('data');
                },
                child: Container(
                  height: 10.h,
                  width: 60.w,
                  alignment: Alignment.center,
                  child: Text(
                    "Download",
                    style: GoogleFonts.poppins(fontSize: 30),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
