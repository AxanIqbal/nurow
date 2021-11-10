import 'package:flutter/material.dart';
import 'package:nurow/Screens/LandingPage/Widgets/navbar_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navbar_mobile.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const NavbarMobile(),
      desktop: const NavbarDesktop(),
    );
  }
}
