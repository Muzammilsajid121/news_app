
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsDatailScreen extends StatefulWidget {
 final String newsImage, newsTitle, date, author, description, content, source;
  const NewsDatailScreen({Key? key,

  required this.newsImage,
  required this.newsTitle,
  required this.date,
  required this.author,
  required this.description,
  required this.content,
  required this.source
  }): super(key: key);

  @override
  State<NewsDatailScreen> createState() => _NewsDatailScreenState();
}

class _NewsDatailScreenState extends State<NewsDatailScreen> {
  
  @override
  Widget build(BuildContext context) {
      // final width = MediaQuery.sizeOf(context).width*1;
  final height = MediaQuery.sizeOf(context).height*1;
    return  Scaffold(
      appBar: AppBar(
         title: Text('DETAILS',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),),
        centerTitle: true,
     
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        ClipRRect(
          borderRadius:  BorderRadius.all(
            Radius.circular(22)

            // topLeft: Radius.circular(30), topRight: Radius.circular(30)
            ),
          child: SizedBox(
            height: height*.4, 
            child: CachedNetworkImage(imageUrl: widget.newsImage,
            fit: BoxFit.cover,
            //if image not show then show indicator
            placeholder:(context, ulr) =>const Center(child:  CircularProgressIndicator(),) 
             
            ),
          ),
        ),
        
        //
        Container(
          height: height*.35,
        //   decoration:const BoxDecoration(
            
        //      borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(30), topRight: Radius.circular(30)
        //       ),
        // ),

        child: ListView(
          children: [
            Text(widget.newsTitle, style: Theme.of(context).textTheme.bodyLarge,),
            
            SizedBox(height: height*.02,),
            Text(widget.source, style: Theme.of(context).textTheme.displaySmall,),


            SizedBox(height: height*.02,),
            Text(widget.description, style: Theme.of(context).textTheme.displaySmall, ),
            // SizedBox(height: height*.02,),
            //  Text(widget.content, style: Theme.of(context).textTheme.displaySmall, ),
            
          ],
        ),
        )
        
          ],
        ),
      ),
    );
  }
}