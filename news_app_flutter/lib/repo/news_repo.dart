import 'dart:convert';

import 'package:news_app_flutter/api.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_flutter/modals/news_modals.dart';

class NewsRepo {
  getNews([String category = "business", String country = "us"]) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apiKey";
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("Error fetching news");
      return NewsResponse.showError(e.toString());
    }
  }
}
