import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/categories_news_model.dart';
import 'package:news_app/models/top_news_headlines_model.dart';

class NewsRepositry{

  Future<TopNewsHeadlinesModel> fetchNewsChannelHeadlinesApi(String channelName) async{
  
 //  String url = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=04011b4b4aba457eaf8d0ad2d393c822';
     String url = 'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=04011b4b4aba457eaf8d0ad2d393c822';

    final response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(response.body);
    }

    if(response.statusCode==200){  //when response is successfull then 200
      final body = jsonDecode(response.body); //Api k response m body ati h
      return TopNewsHeadlinesModel.fromJson(body);  //TopNewsHeadlinesModel is coming from model clasee


    }
    throw Exception("error");

  }

  //Categories
  Future<CategoriesNewsModel> fetchNewscategoriesApi(String category) async{
  
 String url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=04011b4b4aba457eaf8d0ad2d393c822';

    final response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(response.body);
    }

    if(response.statusCode==200){  //when response is successfull then 200
      final body = jsonDecode(response.body); //Api k response m body ati h
      return CategoriesNewsModel.fromJson(body);  //CategoriesNewsModel is coming from model clasee


    }
    throw Exception("error");

  }


}




