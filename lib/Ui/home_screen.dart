import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/models/top_news_headlines_model.dart';
import 'package:news_app/view_model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  newsViewModel NewsViewModel = newsViewModel();  //initilize model which we created in news_view_model.dart

  // final width = MediaQuery.sizeOf(context).width*1;
  // final height = MediaQuery.sizeOf(context).height*1;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("NEWS"),
        leading: IconButton(
          onPressed: (){

          },
           icon: Image.asset('images/category_icon.png'),)
      ),
      body: ListView(
        children: [
          SizedBox(height: 500,
          child: FutureBuilder<TopNewsHeadlinesModel>(
            future: NewsViewModel.fetchNewsChannelHeadlinesApi(),
             builder: ( (context, snapshot) {
              //agar wait horha ho to spinkit dikhaoo
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: SpinKitCircle(color: Colors.blue, size: 30,),

                );

              }
              else{
               return Container();

              }
               
             }
             )
             ),
          
          )
        ],
      ),
    );
  }
}