import 'dart:async';

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
    Future.delayed(const Duration(seconds: 100), SwitchToHomeScreen);
    super.initState();
  }
  //
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset("images/splash_pic.jpg" , fit: BoxFit.contain, ),
          const SizedBox(height: 8,),

         const  Text("Top Headlines"),

         SpinKitChasingDots(color: Colors.blue , size: 45,)

        ],

        ),
      ),
    );
  }
}