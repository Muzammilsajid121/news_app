import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Ui/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //
          scaffoldBackgroundColor: const  Color.fromARGB(255, 236, 236, 236),
       //
        //TEXT THEMES
        textTheme: TextTheme(
            //Body Small
            bodySmall:
                GoogleFonts.montserrat(fontSize: 11,fontWeight: FontWeight.w600, color: Colors.black),
                //
                displaySmall:
                 GoogleFonts.montserrat(fontSize: 13,fontWeight: FontWeight.w500, color: Colors.black),
            //Body Medium
            bodyMedium: GoogleFonts.montserrat(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
            //
            //Body Large; choosen by theme
            bodyLarge: GoogleFonts.roboto(fontSize: 19,  fontWeight: FontWeight.w700, color: Colors.black),
            //
            titleMedium: GoogleFonts.montserrat(fontSize: 31, color: Colors.black , fontWeight: FontWeight.bold),

        ),
        //
         appBarTheme: const  AppBarTheme(
            backgroundColor: Color.fromARGB(255, 44, 62, 92), foregroundColor: Colors.white),
      ),
      //
      home: const SplashScreen(),
    );
  }
}

