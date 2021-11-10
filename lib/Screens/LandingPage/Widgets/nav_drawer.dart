import 'package:flutter/material.dart';
import 'package:nurow/Authentication/Login/login.dart';
import 'package:nurow/Routing/route_names.dart';
import 'package:nurow/Screens/LandingPage/Widgets/drawer_header.dart';
import 'package:nurow/Screens/LandingPage/Widgets/drawer_item.dart';
import 'package:nurow/Screens/contact.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        boxShadow: const [
          BoxShadow(color: Colors.white12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          const NavDrawerHeader(),
          const SizedBox(height: 60),
          const DrawerItem(
            title: 'LOGIN',
            icon: Icons.login,
            navigationPath: LoginPage(),
            avigationPath: loginRoute,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 60),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.contact_mail,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => dialogContact());
                  },
                  child: const Text(
                    'CONTACT',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
