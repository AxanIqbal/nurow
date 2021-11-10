import 'package:flutter/material.dart';
import 'package:nurow/Screens/LandingPage/Widgets/navbar_items.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget navigationPath;
  final String avigationPath;

  const DrawerItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.navigationPath,
      required this.avigationPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 30,
          ),
          NavbarItem(
            title: title,
            navigationPath: navigationPath,
          )
        ],
      ),
    );
  }
}
