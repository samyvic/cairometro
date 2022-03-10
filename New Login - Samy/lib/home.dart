import 'package:flutter/material.dart';
import 'package:new_login/login_screen.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello, Ahmed!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 50,),
                  SizedBox(
                    width: w,
                    height: h*0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.train,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        label: Text('Buy a Ticket'),
                        onPressed: () {
                          print('Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          textStyle: TextStyle(fontSize: 20),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w,
                    height: h*0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.near_me,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        label: Text('Nearest Station'),
                        onPressed: () {
                          print('Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          textStyle: TextStyle(fontSize: 20),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w,
                    height: h*0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.flag,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        label: Text('Tourist Spots'),
                        onPressed: () {
                          print('Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          textStyle: TextStyle(fontSize: 20),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w,
                    height: h*0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        label: Text('Settings'),
                        onPressed: () {
                          print('Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          textStyle: TextStyle(fontSize: 20),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w,
                    height: h*0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        label: Text('Log Out'),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          textStyle: TextStyle(fontSize: 20),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),



          ],
        ),
      ),

    );
  }
}


class eleButton extends StatelessWidget {
  final String tit;
  eleButton(this.tit);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: Text(tit),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.cyan,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          fixedSize: const Size(200, 100),
          //shape: const CircleBorder(),
        ),
      ),
    );
  }
}