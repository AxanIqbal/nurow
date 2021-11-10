import 'package:flutter/material.dart';
import 'package:nurow/Authentication/Widgets/register_form.dart';

class RegisterDesktop extends StatefulWidget {
  const RegisterDesktop({Key? key}) : super(key: key);

  @override
  _RegisterDesktopState createState() => _RegisterDesktopState();
}

class _RegisterDesktopState extends State<RegisterDesktop> {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.grey[400],
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          height: heightSize * 0.72,
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
                const RegisterForm(
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

// Expanded(
//   flex: 1,
//   child: Container(
//     child: Align(
//       alignment: Alignment.center,
//       child: Image.asset('login-image.jpg',
//           height: heightSize * 0.5,
//           width: widthSize * 0.5,
//           semanticLabel: 'test'),
//     ),
//   ),
// ),

/*

icon  <a href="https://ibb.co/f4K2VWj"><img src="https://i.ibb.co/bzyPjVc/X-Icon.png" alt="X-Icon" border="0"></a>
logo name <a href="https://ibb.co/8zsZ3fj"><img src="https://i.ibb.co/M8S0TtR/Just-nurow-Dark.png" alt="Just-nurow-Dark" border="0"></a>

*/
