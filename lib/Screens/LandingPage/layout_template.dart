import 'package:flutter/material.dart';
import 'package:nurow/Screens/LandingPage/Widgets/nav_drawer.dart';
import 'package:nurow/Screens/LandingPage/Widgets/navbar.dart';
import 'package:nurow/Screens/LandingPage/landing_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? const NavDrawer()
            : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                ? const NavDrawer()
                : null,
        backgroundColor: Colors.grey[400],
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Navbar(),
            SizedBox(
              height: 30,
            ),
            Expanded(child: LandingPage()),
          ],
        ),
      ),
    );
  }
}
