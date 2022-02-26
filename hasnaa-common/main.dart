import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  //int y=DateTime. now().toUtc().millisecondsSinceEpoch;
   // print(y);
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
 String name ='hasnaa' ;
 String origin_station = 'shoubra';
 String destination_station = 'elbhoos';
 int x=DateTime. now().toUtc().millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        child: QrImage(
          data: "$name$origin_station$destination_station$x",
          version: QrVersions.auto,
          size: 200.0,
          padding: EdgeInsets.all(40),
        ),

      )),
    );
  }
}
