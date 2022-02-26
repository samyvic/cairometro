import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  //final Function screen;
  final String title;
  final IconData icon;
  ListTitle(this.title , this.icon);//this.screen,
  @override
  Widget build(BuildContext context) {
    return ListTile(
              leading: Icon(
                icon,
                size: 26,
              ),
              title: Text(title),
              onTap: (){},
            );
  }

}