import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int index = 0;
  final Screens = [
    Home(),
    const Center(
        child: Text(
          'Info',
          style: TextStyle(fontSize: 60),
        )),
    // About(),
    const Center(
        child: Text(
          'Tickets',
          style: TextStyle(fontSize: 60),
        )),
    Center(
        child: Text(
          'History',
          style: TextStyle(fontSize: 60),
        )),
    // About(),
    const Center(
        child: Text(
          'Account',
          style: TextStyle(fontSize: 60),
        )),
    // Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.map, size: 30),
      const Icon(Icons.add_rounded, size: 30),
      const Icon(Icons.history, size: 30),
      const Icon(Icons.person, size: 30),
    ];
    return Scaffold(
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
    );
  }
}