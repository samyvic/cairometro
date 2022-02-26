import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:metrotic/widgets/body_home.dart';
import 'package:metrotic/widgets/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: mainDrawer(),
      body: bodyHome(),
    );
  }
}
