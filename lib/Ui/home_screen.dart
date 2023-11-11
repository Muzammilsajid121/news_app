import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
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

  final format = DateFormat('MMMM dd, yyyy');

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
                 
                  //date time change karwanay k liay aur show karnay k liayy
                  DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                  //

                  return SizedBox(
                    
                child: Stack(
                  children: [
                    Container(
                      height: 480, width: 320,
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(10),
                      //
                      //wrap cachednet with clipRReact to make border circular
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                        fit: BoxFit.cover,
                        
                        placeholder: (context, url) => Container(child: spinkit2,),
                        errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,),),
                      ),
                      
                    ),
                    //
                    //
                    Positioned(
                      bottom: 40, left: 10, right: 10,
                      child: Card(
                        // elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        //

                        child: Container(
                          padding: EdgeInsets.all(8),
                          // height: 90,width: 300,
                          height: 130,
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 300,
                                child: Text(snapshot.data!.articles![index].title.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              //Source and date time
                              Spacer(),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //source
                                     Text(snapshot.data!.articles![index].source!.name.toString(),
                                     style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,),
                                //date time
                                 Text(format.format(dateTime),
                                  style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,),
                                    
                                  ],
                                ),
                              )
                    
                            ],
                          ),
                        ),
                      ),
                    ),
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
  
