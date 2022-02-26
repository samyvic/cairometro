import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/curve.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor('#83b282'),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //padding: EdgeInsets.only(top: size.height*0.047),
              height: size.height*0.3,
              width: size.width,
              child: CustomPaint(
                painter: CurvePainter(),
              ),
            ),
            SizedBox(
              height: size.height*0.01,
            ),
            Image.asset(
              'images/50316.png',
              //width: size.width ,
              height: size.height * 0.25,
            ),
            SizedBox(
              height: size.height*0.01,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  primary: HexColor('#83b282'),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              onPressed: () {},
              child: const Text('CREATE ACCOUNT'),
            ),
            SizedBox(
              height: size.height*0.01,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  primary: HexColor('#83b282'),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              onPressed: () {},
              child: const Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}
