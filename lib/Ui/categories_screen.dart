

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Ui/home_screen.dart';
import 'package:news_app/models/categories_news_model.dart';
import 'package:news_app/view_model/news_view_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

 newsViewModel NewsViewModel = newsViewModel();  //initilize model which we created in news_view_model.dart
final format = DateFormat('MMMM dd, yyyy');
String categoryName = "General";  //name as same as in api documentry

List<String> categoriesList = [
  'General', 'Entertainment', 'Health', 'Sports', 'Business', 'Technology'

];
  @override
  Widget build(BuildContext context) {
       final width = MediaQuery.sizeOf(context).width*1;
  final height = MediaQuery.sizeOf(context).height*1;
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // SizedBox(height: 50,),
            SizedBox(
              height:50, //height of tabs
             
              child: ListView.builder( 
                scrollDirection: Axis.horizontal,
                itemCount: categoriesList.length,
      
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: () {
                      categoryName=categoriesList[index];
                      setState(() {
                        
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(   //y wo container hai jo uper categories dikha rha h
                  
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(categoriesList[index].toString(),style: Theme.of(context).textTheme.bodyMedium,),
                        ),
                        decoration: BoxDecoration(
                          color:   categoryName==categoriesList[index]? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    ),
                  );
      
                }
                ),
            ),
            //
            //
             Expanded(
               child: FutureBuilder<CategoriesNewsModel>(
                         future: NewsViewModel.fetchNewscategoriesApi(categoryName),
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
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.articles!.length,  //saray articles ki length
                  itemBuilder: (context, index){
                   
                    //date time change karwanay k liay aur show karnay k liayy
                    DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                    //
             
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          ClipRRect(

                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                          fit: BoxFit.cover,
                          height:height*.28 , width: width*.4,
                          
                          placeholder: (context, url) => Container(child: spinkit2,),
                          errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,),),
                        ),
                        //
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              
                              height: height*.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data!.articles![index].title.toString(),
                                  maxLines: 3,
                                  style: Theme.of(context).textTheme.bodyMedium,),
                                  //
                                      Text(snapshot.data!.articles![index].source!.name.toString(),
                                 
                                  style: Theme.of(context).textTheme.bodySmall,),
                                  //
                                  // SizedBox(width: width*.03,),
                                    Text(format.format(dateTime),
                                 
                                  style: Theme.of(context).textTheme.bodySmall,),
                          
                                  // Spacer(),
                                  // SizedBox(height: height*.02,),
                                  // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                    
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ))
                        ],
                        
                      ),
                    );
             
                  });
             
                }
                 
               }
               )
               ),
             ),


            //
          ],
        ),
      ),
      
    );
  }
}