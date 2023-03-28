import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lastexam/Screen/news_app/model/NewsModel.dart';

class News_Controller extends GetxController {
  Rx<TextEditingController> txtSearch = TextEditingController().obs;
  Articles? articles;

  void AddData(Articles data) {
    articles = data;
    update();
  }
}
