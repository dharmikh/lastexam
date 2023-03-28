import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lastexam/Screen/news_app/model/NewsModel.dart';

class newsdata {
  Future<NewsModel?> getnewsdata(String search) async {
    print("Start");
    var response = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/everything?q=$search&from=2023-02-28&sortBy=publishedAt&apiKey=4a087d8a1d2a441283bd06d4b01920d6"),
    );
    print("response======");
    if(response.statusCode == 200)
    {
      var json = jsonDecode(response.body);
      print("==== $json");
      return NewsModel.fromJson(json);
    }
    else
    {
      print("ERROR 400");
      return null;
    }
  }
}
