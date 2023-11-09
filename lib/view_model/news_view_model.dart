
import 'package:http/http.dart';
import 'package:news_app/models/top_news_headlines_model.dart';
import 'package:news_app/repositry/news_repositry.dart';

class newsViewModel{

  final _rep = NewsRepositry();  //from newsRepositry class

  Future<TopNewsHeadlinesModel> fetchNewsChannelHeadlinesApi() async{  //func name same as news repos class func, it helps to understand and remember

  final response = await _rep.fetchNewsChannelHeadlinesApi();
  return response;  //response is what u getting in news_reps.dart class
  }
}