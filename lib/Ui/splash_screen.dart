import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/Ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //splash
 void SwitchToHomeScreen() {
    Navigator.pushReplacement(   //push replacement means you cant go back to this screen
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 32), SwitchToHomeScreen);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {


final height = MediaQuery.sizeOf(context).height *1;
final width = MediaQuery.sizeOf(context).width *1;

    return  Scaffold(


      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Image.asset("images/1.png" ,fit: BoxFit.cover, height: height*0.5, width: width*0.99, ),

           SizedBox(height: height*0.04,),

         

          SizedBox(height: height*0.02),

       
       Lottie.asset('images/newsani.json', height: 300, width: 280),

       const  Text("News App"),

       const   SpinKitPouringHourGlass(color: Colors.orange , size: 40,),
       

        ],

        ),
      ),
    );
  }
}