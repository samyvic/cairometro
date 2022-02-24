import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'curve.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //bool _showPassword = false;
  bool hidePassword = true;
  bool obscure = true;
  Icon icon = Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;


    return Scaffold(
        backgroundColor: Color(0xFFEFC437),
        body: Column(
          children: [
            Container(
              //padding: EdgeInsets.only(top: size.height*0.047),
              width: w,
              height: h*0.15,
              child: CustomPaint(
                painter: CurvePainter(),
              ),
            ),
            Container(
              child: Text(
                  "WEY Metro Ticket",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
              ),
            ),
            SizedBox(height:50),
            Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "img/logo.png"
                  ),

                ),

              ),
            ),
            SizedBox(height:70),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal:100, vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter Your Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:100, vertical: 10),
                    child: TextField(
                      obscureText: obscure,

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        /*suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: this._showPassword ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => this._showPassword = !this._showPassword);
                          },
                        ),*/
                        suffixIcon: IconButton(
                          icon: hidePassword
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                              if (obscure == true) {
                                obscure = false;
                                icon = Icon(Icons.visibility_off);
                              } else {
                                obscure = true;
                                icon = Icon(Icons.visibility);
                              }
                            });
                          },

                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Your Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                        "Forgot your password ?",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent, // background
                            onPrimary: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ), // foreground
                          ),
                          onPressed: () { },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40),
                            child: Text('LOGIN',
                                style: TextStyle(
                                  fontSize: 30,
                                  //fontWeight: FontWeight.bold,

                                )
                            ),
                          )

                      )
                  )

                ],
              )
            ),
            SizedBox(height: 20),






          ],
        )
    );
  }
}
