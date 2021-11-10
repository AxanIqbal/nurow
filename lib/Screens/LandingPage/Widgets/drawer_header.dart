import 'package:flutter/material.dart';

class NavDrawerHeader extends StatelessWidget {
  const NavDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.grey[500],
        alignment: Alignment.center,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 140),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network('https://i.ibb.co/bzyPjVc/X-Icon.png'),
            ),
          ],
        ),
      ),
    );
  }
}
