import 'package:flutter/material.dart';
import 'package:nurow/Authentication/Login/login.dart';
import 'package:nurow/Screens/LandingPage/Widgets/navbar_items.dart';
import 'package:nurow/Screens/LandingPage/Widgets/navbar_logo.dart';
import 'package:nurow/Screens/contact.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavbarItem(
                title: 'LOGIN',
                navigationPath: LoginPage(),
              ),
              const SizedBox(
                width: 60,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context, builder: (context) => dialogContact());
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
              const SizedBox(
                width: 60,
              ),
            ],
          )
        ],
      ),
    );
  }
}
