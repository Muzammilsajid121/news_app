import 'dart:html';

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
      final width = MediaQuery.sizeOf(context).width*1;
  final height = MediaQuery.sizeOf(context).height*1;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
        Center(
          child: SizedBox(
            height: height*.45,  width: width*.6,
            child: CachedNetworkImage(imageUrl: widget.newsImage,
            fit: BoxFit.cover,
            //if image not show then show indicator
            placeholder:(context, ulr) =>Center(child:const  CircularProgressIndicator(),) 
             
            ),
          ),
        ),
      
        //
        Container(
          height: height*.4,
          decoration: BoxDecoration(
          // color: Colors.white
        ),
        child: ListView(
          children: [
            Text(widget.newsTitle, style: Theme.of(context).textTheme.bodyMedium,),
      
            SizedBox(height: height*.02,),
            Row(
              children: [
                 Text(widget.source, style: Theme.of(context).textTheme.bodyMedium,),
      
              ],
            )
      
          ],
        ),
        )
      
          ],
        ),
      ),
    );
  }
}