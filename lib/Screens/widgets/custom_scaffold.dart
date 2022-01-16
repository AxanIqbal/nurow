import 'package:flutter/material.dart';

import 'PagesNavbar/nav_bar.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PagesNavBar(),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
