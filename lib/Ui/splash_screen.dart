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
 void switchToHomeScreen() {
    Navigator.pushReplacement(   //push replacement means you cant go back to this screen
        context, MaterialPageRoute(builder: (context) =>const  HomeScreen()));
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), switchToHomeScreen);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {


final height = MediaQuery.sizeOf(context).height *1;
final width = MediaQuery.sizeOf(context).width *1;

    return  Scaffold(
     


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [

       Lottie.asset('images/newsani.json', height: height*.3, width: width*.5),
       Text("News App", style: Theme.of(context).textTheme.titleMedium),
       Text("By Muzammil", style: Theme.of(context).textTheme.bodyMedium),

       SizedBox(height: height*0.02),
       const   SpinKitFadingCube(color: Colors.orange , size: 20,),
      
      ],

      ),
    );
  }
}