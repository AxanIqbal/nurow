import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 80,
        width: 150,
        child: Row(
          children: [
            SizedBox(
                height: 40,
                width: 150,
                child: Image.network(
                    'https://i.ibb.co/M8S0TtR/Just-nurow-Dark.png')),
          ],
        ),
      ),
    );
  }
}
