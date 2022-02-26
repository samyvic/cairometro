import 'package:flutter/material.dart';
import 'package:metrotic/widgets/list_title.dart';
class dashPage extends StatelessWidget {
  final Size size;
  dashPage(this.size);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: size.height,
        width: double.infinity,
        padding:const EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/pexels-photo-3651816.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTitle(
              'Profile',
              Icons.account_circle_rounded,
            ),
            const SizedBox(
              height: 20,
            ),
            ListTitle(
              'New Ticket',
              Icons.add_sharp,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTitle(
              'Subscriptions',
              Icons.add_sharp,
            ),
            const SizedBox(
              height: 10,
            ),
             ListTitle(
              'suggestions & complaints',
              Icons.border_color_sharp,//feedback_sharp 
            ),
            const SizedBox(
              height: 10,
            ),
             ListTitle(
              'Contact',
              Icons.contact_support_sharp,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTitle(
              'FAQ',
              Icons.phone,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTitle(
              'ABOUt',
              Icons.help_outline_rounded,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTitle(
              'LOG OUT',
              Icons.logout,
              //Icons.backspace_sharp,
            ),

          ],
        ),
      ),
    );
  }
}