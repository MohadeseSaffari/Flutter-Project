import 'dart:convert';

import 'package:flutter_application_1/model/article_model.dart';
import 'package:http/http.dart' as http;
class OnlineNews{
  List<ArticleModel> news = [];

  Future<void> getNews()async{
    String url="https://newsapi.org/v2/everything?q=tesla&from=2024-05-04&sortBy=publishedAt&apiKey=72706a69969c4c9eb457f5711b3ff420";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData["status"] == "ok"){
      jsonData["article"].forEach((element){
        if (element["urlToImage"] != null && element("description") != null) {
          ArticleModel articleModel = ArticleModel(
            author: element["author"],
            title:element["title"],
            description:element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            publishedAt: element["publishedAt"],
            content: element["content"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}