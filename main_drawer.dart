import 'package:flutter/material.dart';
import 'package:metrotic/widgets/dash_page.dart';
//import 'package:metrotic/widgets/list_title.dart';

class mainDrawer extends StatelessWidget {
  const mainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return dashPage(size);
  }
}
