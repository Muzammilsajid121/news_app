import 'package:flutter/material.dart';

class MediaSize extends StatelessWidget {
  const MediaSize({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.sizeOf(context).height *1;
final width = MediaQuery.sizeOf(context).width *1;

    return  Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height*0.5,
            width: width*0.3,
            decoration: BoxDecoration(
              color: Colors.purple
            ),
          ),
          
          //
           Container(
             height: height*1,
            width: width*0.7,
            decoration: BoxDecoration(
              color: Colors.yellow
            ),
          )
        ],
      ),
    );
  }
}