import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
          primary: HexColor('#FFFC'),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          fixedSize: const Size(100, 100),
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
