import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:metrotic/widgets/ele_button.dart';

class bodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('images/pexels-photo-3651816.jpeg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7), BlendMode.dstATop),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/50316.png',
            //width: size.width ,
            height: size.height * 0.25,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [eleButton('Maps'), eleButton('Lines')],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              eleButton('Tourist spots'),
              eleButton('Nearest stations')
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                primary: HexColor('#FFFF'),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            onPressed: () {},
            child: const Text('Buy a Ticket'),
          ),
        ],
      ),
    );
  }
}
