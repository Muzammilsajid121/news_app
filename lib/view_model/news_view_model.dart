
import 'package:news_app/models/categories_news_model.dart';
import 'package:news_app/models/top_news_headlines_model.dart';
import 'package:news_app/repositry/news_repositry.dart';

class newsViewModel{

  final _rep = NewsRepositry();  //from newsRepositry class

  Future<TopNewsHeadlinesModel> fetchNewsChannelHeadlinesApi(String channelName) async{  //func name same as news repos class func, it helps to understand and remember

  final response = await _rep.fetchNewsChannelHeadlinesApi(channelName);
  return response;  //response is what u getting in news_reps.dart class
  }

  //categoriesapi
   Future<CategoriesNewsModel> fetchNewscategoriesApi(String category) async{  //func name same as news repos class func, it helps to understand and remember

  final response = await _rep.fetchNewscategoriesApi(category);
  return response;  //response is what u getting in news_reps.dart class
  }


}