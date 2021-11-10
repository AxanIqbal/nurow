import 'package:flutter/material.dart';

class PatientDetailsText extends StatelessWidget {
  final sizingInformation;
  final width;
  const PatientDetailsText({
    Key? key,
    this.sizingInformation,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        padding: const EdgeInsets.all(5),
        child: patientText(sizingInformation));
  }
}

Widget patientText(sizingInformation) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        """ 
Patient Name
DOB 
X-Ray Type
""",
        style: TextStyle(
          color: Colors.black,
          fontSize: sizingInformation.isTablet ? 15 : 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
      Text(
        """ 
: John Doe
: 12/12/12
: Left Bitewing
""",
        style: TextStyle(
          color: Colors.black,
          fontSize: sizingInformation.isTablet ? 15 : 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      )
      // Text(
      //   name,
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontSize: sizingInformation.isTablet ? 15 : 18,
      //     fontWeight: FontWeight.w600,
      //     fontFamily: 'Poppins',
      //   ),
      // ),
      // SizedBox(
      //   width: width,
      // ),
      // Text(
      //   ": ",
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontSize: sizingInformation.isTablet ? 15 : 18,
      //     fontWeight: FontWeight.w600,
      //     fontFamily: 'Poppins',
      //   ),
      // ),
      // Text(
      //   value,
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontSize: sizingInformation.isTablet ? 15 : 18,
      //     fontWeight: FontWeight.w600,
      //     fontFamily: 'Poppins',
      //   ),
      // ),
    ],
  );
}
