import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(30.0),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 200,
                  child: Image.asset(
                    'assets/nurrow logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Please Wait...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const CircularProgressIndicator(),
              ],
            )),
      ),
    );
  }
}
