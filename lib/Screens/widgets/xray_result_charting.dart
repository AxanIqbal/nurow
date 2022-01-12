import 'package:flutter/material.dart';

class XRayResultCharting extends StatelessWidget {
  const XRayResultCharting({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
        // padding: const EdgeInsets.all(10),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: List<Widget>.generate(16, (index) {
        //         return InkWell(
        //           onTap: () {},
        //           child: SizedBox(
        //             width: MediaQuery.of(context).size.width * ((1 / 16) / 2.7),
        //             height: MediaQuery.of(context).size.height * (0.1 / 2.6),
        //             child: Center(
        //               child: Text(
        //                 (index + 1).toString(),
        //                 textAlign: TextAlign.center,
        //               ),
        //             ),
        //           ),
        //         );
        //       }),
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: List<Widget>.generate(16, (index) {
        //         return InkWell(
        //           onTap: () {},
        //           child: SizedBox(
        //             width: MediaQuery.of(context).size.width * ((1 / 16) / 2.7),
        //             height: MediaQuery.of(context).size.height * (0.1 / 2.6),
        //             child: Center(
        //               child: Text(
        //                 (index + 17).toString(),
        //                 textAlign: TextAlign.center,
        //               ),
        //             ),
        //           ),
        //         );
        //       }),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
