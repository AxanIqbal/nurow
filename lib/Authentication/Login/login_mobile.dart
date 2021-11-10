import 'package:flutter/material.dart';
import 'package:nurow/Authentication/Widgets/login_form.dart';

class MobileMode extends StatefulWidget {
  const MobileMode({Key? key}) : super(key: key);

  @override
  _MobileModeState createState() => _MobileModeState();
}

class _MobileModeState extends State<MobileMode> {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Colors.grey[800] ?? Colors.grey,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 250,
                child: Image.network(
                    'https://i.ibb.co/M8S0TtR/Just-nurow-Dark.png'),
              ),
              const SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                child: LoginForm(0.007, 0.04, widthSize * 0.04, 0.06, 0.04,
                    0.07, widthSize * 0.09, 0.05, 0.032, 0.04, 0.032),
              )
            ],
          ),
        ),
      ),
    );
  }
}
