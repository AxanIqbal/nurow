import 'package:flutter/material.dart';
import 'package:nurow/Authentication/Widgets/login_form.dart';

class DesktopMode extends StatelessWidget {
  const DesktopMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.grey[400],
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          height: heightSize * 0.65,
          width: widthSize * 0.65,
          child: Container(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 250,
                  child: Image.network(
                      'https://i.ibb.co/M8S0TtR/Just-nurow-Dark.png'),
                ),
                const SizedBox(height: 60),
                const LoginForm(
                  0,
                  0.009,
                  16,
                  0.04,
                  0.01,
                  0.04,
                  75,
                  0.01,
                  0.007,
                  0.01,
                  0.006,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
