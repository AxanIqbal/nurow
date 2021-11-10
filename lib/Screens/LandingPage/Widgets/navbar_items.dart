import 'package:flutter/material.dart';

class NavbarItem extends StatelessWidget {
  final String title;
  final Widget navigationPath;
  final String? avigationPath;

  const NavbarItem(
      {Key? key,
      required this.title,
      required this.navigationPath,
      this.avigationPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => navigationPath));
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
