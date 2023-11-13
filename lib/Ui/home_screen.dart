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

  enum FilterList {bbcNews, aryNews, independent, reuters, cnn, bloomberg, alJazeera}  //for popup in app bar

class _HomeScreenState extends State<HomeScreen> {



  newsViewModel NewsViewModel = newsViewModel();  //initilize model which we created in news_view_model.dart

  // final width = MediaQuery.sizeOf(context).width*1;
  // final height = MediaQuery.sizeOf(context).height*1;

  final format = DateFormat('MMMM dd, yyyy');
  FilterList? selectedMenu; 

  String name = "bbc-news";  //name as same as in api documentry



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("NEWS",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){

          },
           icon: Image.asset('images/category_icon.png'),),
        
        actions: [
          PopupMenuButton<FilterList>(
            initialValue: selectedMenu,
            icon:const Icon(Icons.more_vert) ,
            //
            onSelected: (FilterList item){
              if(FilterList.bbcNews.name == item.name){
                name ='bbc-news';
              }
              if(FilterList.aryNews.name == item.name){
                name ='ary-news';
              }
              if(FilterList.alJazeera.name == item.name){
                name ='al-jazeera-english';
              }
              if(FilterList.bloomberg.name == item.name){
                name ='bloomberg';
              }
              if(FilterList.cnn.name == item.name){
                name ='cnn';
              }
              print('Selected News Source: $name');
              setState(() {
                selectedMenu=item;
              });
            },
            itemBuilder:(BuildContext context) => <PopupMenuEntry<FilterList>> [
             const PopupMenuItem<FilterList>(
                value: FilterList.bbcNews,
                child: Text('BBC News') ,
              ),
              //ARY
              const  PopupMenuItem<FilterList>(
                value: FilterList.aryNews,
                child: Text('ARY News') ,
              ),
              //Al-Jazeera
             const   PopupMenuItem<FilterList>(
                value: FilterList.alJazeera,
                child: Text('Al Jazeera News') ,
              ),
               //Al-Jazeera
              const  PopupMenuItem<FilterList>(
                value: FilterList.bloomberg,
                child: Text('Bloomberg News') ,  //this is name that showing in popupmenu
              ),
               //Cnn
             const  PopupMenuItem<FilterList>(
                value: FilterList.cnn,
                child: Text('Cnn News') ,  
              ),

            ])
        ],
      ),
      body: ListView(
        
        children: [
          SizedBox(height: 500,
          child: FutureBuilder<TopNewsHeadlinesModel>(
            future: NewsViewModel.fetchNewsChannelHeadlinesApi(name),
             builder: ( (context, snapshot) {
              //agar wait horha ho to spinkit dikhaoo
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(
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
                      padding:const EdgeInsets.all(10),
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
                          padding:const EdgeInsets.all(8),
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
                           const   Spacer(),
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
  
