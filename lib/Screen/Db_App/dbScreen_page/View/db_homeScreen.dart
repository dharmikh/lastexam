import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lastexam/Screen/Db_App/dbScreen_page/controller/Db_controller.dart';
import 'package:lastexam/Screen/news_app/News_controller/News_controller.dart';
import 'package:sizer/sizer.dart';

class dh_HomeScreen extends StatefulWidget {
  const dh_HomeScreen({Key? key}) : super(key: key);

  @override
  State<dh_HomeScreen> createState() => _dh_HomeScreenState();
}

class _dh_HomeScreenState extends State<dh_HomeScreen> {
  News_Controller news_controller = Get.put(News_Controller());
  Db_controller db_controller = Get.put(Db_controller());

  @override
  void initState() {
    db_controller.getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${news_controller.articles!.title}"),
        ),
        body: ListView.builder(
          itemCount: db_controller.Datalist.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Container(
              color: Colors.red,
              child: Text("${db_controller.Datalist[index]['dis']}"),
            ));
          },
        ),
      ),
    );
  }
}
