import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:login_screen/qr.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //bool _showPassword = false;
  bool hidePassword = true;
  bool obscure = true;
  Icon icon = const Icon(Icons.visibility);
  int currentIndex = 0;
  int index = 2;
  final Screens = [
    const Center(
        child: Text(
      'Home',
      style: TextStyle(fontSize: 60),
    )),
    // HomePage(),
    const Center(
        child: Text(
      'Feed',
      style: TextStyle(fontSize: 60),
    )),
    // About(),
    const Qrscreen(),
    const Center(
        child: Text(
      'Settings',
      style: TextStyle(fontSize: 60),
    )),
    // About(),
    const Center(
        child: Text(
      'Profile',
      style: TextStyle(fontSize: 60),
    )),
    // Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.search, size: 30),
      const Icon(Icons.favorite, size: 30),
      const Icon(Icons.settings, size: 30),
      const Icon(Icons.person, size: 30),
    ];
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('SUMMARY'),
          centerTitle: true,
          leading: const BackButton(),
          // leading: IconButton(
          //   icon:Icon(Icons.menu),
          //   onPressed: () {}
          // ),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {})
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          //backgroundColor: Colors.orange,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xff2790B0),
                Colors.cyan,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.star), text: "Feed"),
              Tab(icon: Icon(Icons.face), text: "Profile"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
              Tab(icon: Icon(Icons.favorite), text: "Ahmed"),
            ],
          ),
          //elevation: 4,
        ),
        body: IndexedStack(
          index: index,
          children: Screens,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            items: items,
            index: index,
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) => setState(() => this.index = index),
            backgroundColor: Colors.transparent,
            color: Colors.cyan,
            buttonBackgroundColor: Colors.cyan,
          ),
        ),
      ),
    );
  }
}
