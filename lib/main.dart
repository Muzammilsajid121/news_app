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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //
          scaffoldBackgroundColor:  Color.fromARGB(255, 189, 188, 188),
       //
        //TEXT THEMES
        textTheme: TextTheme(
            //Body Small
            bodySmall:
                GoogleFonts.montserrat(fontSize: 14, color: Color(0xffABB4BD)),
            //Body Medium
            bodyMedium: GoogleFonts.montserrat(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
            //
            //Body Large; choosen by theme
            bodyLarge: GoogleFonts.roboto(fontSize: 17, color: Colors.black),
            //
            titleMedium: GoogleFonts.dmSans(fontSize: 23, color: Colors.black),

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

