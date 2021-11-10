import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Routing/route_names.dart';
import 'package:nurow/Routing/router.dart';
import 'package:nurow/Screens/widgets/PagesNavbar/nav_bar.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/controller/auth.dart';
import 'package:nurow/locator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        backgroundColor: Colors.grey[400],
        body: sizingInformation.isMobile
            ? Stack(
                children: [
                  Center(
                    child: Expanded(
                      child: Navigator(
                        key: locator<NavigationService>().navigatorKey,
                        onGenerateRoute: generateRoute,
                        initialRoute: analysisPage,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 15,
                    left: 15,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Icon(
                        Icons.menu,
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PagesNavBar(),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Navigator(
                      key: locator<NavigationService>().navigatorKey,
                      onGenerateRoute: generateRoute,
                      initialRoute: analysisPage,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
