import 'package:flutter/material.dart';
class Qrscreen extends StatelessWidget {
  const Qrscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "img/logo.png"
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:140.0),
                    child: ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan, // background
                          onPrimary: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ), // foreground
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40),
                          child: Text('El Mazalat',
                              style: TextStyle(
                                fontSize: 30,
                                //fontWeight: FontWeight.bold,
                              )
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("To",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:140.0),
                    child: ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff2790B0), // background
                          onPrimary: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ), // foreground
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40),
                          child: Text('Adly Mansour',
                              style: TextStyle(
                                fontSize: 30,

                                //fontWeight: FontWeight.bold,
                              )
                          ),
                        )
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "img/img.png"
                  ),

                ),

              ),
            ),
          ],
        )


      )
    );
  }
}
