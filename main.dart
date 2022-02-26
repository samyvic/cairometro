import 'package:flutter/material.dart';
import 'package:metrotic/screens/home_screen.dart';
import 'package:metrotic/screens/splash_screen.dart';
import 'package:metrotic/screens/welcome_screen.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'METRO',
     initialRoute: '/', 
      routes: {
       // '/' : (ctx)=>welcomeScreen(),
      // '/' : (ctx)=>HomeScreen(),
      '/':(ctx)=>SplashScreen(),
      },    
    );
  }
}



