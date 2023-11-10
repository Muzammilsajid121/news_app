import 'package:cached_network_image/cached_network_image.dart';
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
              else if (snapshot.hasError || snapshot.data == null) {
      return Center(
        child: Text("Error loading data : ${snapshot.error} "),
      );
              }
              else{ 
                // print(snapshot.data);
               return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.articles!.length,  //saray articles ki length
                itemBuilder: (context, index){
                  //
          //           // Check for null values before accessing properties
          // String imageUrl = snapshot.data!.articles![index].urlToImage ?? "";

                  return SizedBox(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: SizedBox(
                        child: CachedNetworkImage(imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                        // fit: BoxFit.contain,
                        height: 300, width: 300,
                        placeholder: (context, url) => Container(child: spinkit2,),
                        errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,),),
                      ),
                    )
                  ],
                ),
               );

                });

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
const spinkit2 =  SpinKitFadingCircle(
  color:Colors.amber, size: 30,
);
  
