
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_login/profile_screen.dart';
import 'package:new_login/signup.dart';
import 'package:new_login/login_screen.dart';

import 'auth.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "Register" : (BuildContext context)=>Signup(),
        "Login" : (BuildContext context)=>LoginScreen(),
        "Home" : (BuildContext context)=>ProfileScreen(),

      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialize Firebase App
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return Auth();
              }
              return const Center(child: CircularProgressIndicator(),);
            }
        )
    );
  }
}








