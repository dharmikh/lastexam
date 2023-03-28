import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastexam/Screen/news_app/News_controller/News_controller.dart';
import 'package:lastexam/Screen/news_app/model/NewsModel.dart';
import 'package:lastexam/utils/helper_class/Api/Api_helper.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  News_Controller news_controller = Get.put(News_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          actions: [
            InkWell(
              onTap: () {
                Get.offNamed('login');
              },
              child: Padding(
                padding:  EdgeInsets.only(right: 5.w),
                child: Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            Container(
              height: 3.h,
              width: 85.w,
              child: TextFormField(
                controller: news_controller.txtSearch.value,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                      gapPadding: 10, borderRadius: BorderRadius.circular(50)),
                ),
                onFieldSubmitted: (value) {
                  newsdata().getnewsdata(
                      news_controller.txtSearch.value.text.isEmpty
                          ? "India"
                          : news_controller.txtSearch.value.text);
                },
                cursorColor: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey,
        body: FutureBuilder<NewsModel?>(
          future: newsdata().getnewsdata(
              news_controller.txtSearch.value.text.isEmpty
                  ? "India"
                  : news_controller.txtSearch.value.text),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              List<Articles>? data = snapshot.data!.articles;
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      news_controller.AddData(data[index]);
                      Get.toNamed('news2');
                    },
                    child: Container(
                      height: 25.h,
                      width: 100.w,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 25.h,
                            width: 100.w,
                            child: Image.network(
                              "${data[index].urlToImage}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              child: Text(
                                "${data[index].title}",
                                maxLines: 2,
                                style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
