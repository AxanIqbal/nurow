import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'PagesNavbar/nav_bar.dart';

class CustomScaffold extends GetResponsiveView {
  CustomScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      drawer: screen.responsiveValue(
        mobile: const PagesNavBar(),
      ),
      floatingActionButton: screen.isPhone || screen.isTablet
          ? Builder(builder: (context) {
              return FloatingActionButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                backgroundColor: Colors.grey[500],
              );
            })
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (screen.isDesktop || screen.isTablet) ...{
              const PagesNavBar(),
              const SizedBox(
                height: 30,
              ),
            },
            Expanded(
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
