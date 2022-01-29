import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Routing/route_names.dart';
import 'package:nurow/controller/auth.dart';

class PagesNavBar extends StatelessWidget {
  const PagesNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: context.responsiveValue(
        desktop: MediaQuery.of(context).size.width * 0.17,
        tablet: MediaQuery.of(context).size.width * 0.3,
        mobile: MediaQuery.of(context).size.width * 0.7,
        watch: MediaQuery.of(context).size.width * 0.8,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            20,
          ),
          topRight: Radius.circular(
            20,
          ),
        ),
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: 150,
              child: Image.asset(
                'assets/nurrow logo.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          navbarItem(
            "Analyse Radiograph",
            'assets/Analyse Radiograph.png',
            analysisPage,
            context,
          ),
          navbarItem(
            "Subtractive Imagery",
            'assets/subtractive imagery.png',
            subAnalysisPage,
            context,
          ),
          navbarItem(
            "Pathology Investigation",
            'assets/pathology investigation.png',
            "",
            context,
          ),
          navbarItem(
            "Patient Data",
            'assets/patient records.png',
            patientDetailsPage,
            context,
          ),
          navbarItem(
            "User Management",
            'assets/user management.png',
            "",
            context,
          ),
          navbarItem(
            "Audit",
            'assets/audit.png',
            auditPage,
            context,
          ),
          navbarItem(
            "License Management",
            'assets/license.png',
            "",
            context,
          ),
          navbarItem(
            "Support",
            'assets/Support.png',
            "",
            context,
          ),
          TextButton(
            onPressed: () async {
              await AuthController.instance.signOutEntry();
            },
            child: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                  (Set<MaterialState> states) {
                return EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                  vertical: MediaQuery.of(context).size.height * 0.015,
                );
              }),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.2);
                  }
                  return Colors.red; // Use the component's default.
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget navbarItem(
    String name, String icon, String routeName, BuildContext context) {
  return ListTile(
    // mainAxisSize: MainAxisSize.min,
    // mainAxisAlignment: MainAxisAlignment.center,
    onTap: () {
      if (routeName == 'selectImage') {
        Get.offAllNamed('/');
        return;
      }
      Get.offAllNamed("/$routeName");
    },
    contentPadding: const EdgeInsets.only(left: 10.0),
    // horizontalTitleGap: 1.0,
    dense: true,
    minLeadingWidth: 0,
    title: AutoSizeText(
      name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      minFontSize: 0,
      stepGranularity: 0.1,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    leading: SizedBox(
      // constraints: const BoxConstraints(
      //   maxWidth: 30,
      //   maxHeight: 23,
      // ),
      width: context.responsiveValue(
        desktop: MediaQuery.of(context).size.width * 0.02,
        tablet: MediaQuery.of(context).size.width * 0.04,
        mobile: MediaQuery.of(context).size.width * 0.07,
        watch: MediaQuery.of(context).size.width * 0.08,
      ),
      height: MediaQuery.of(context).size.height * 0.025,
      child: Image.asset(
        icon,
        color: Colors.white,
        fit: BoxFit.fill,
      ),
    ),
    // leading: Icon(
    //   icon,
    //   color: Colors.white,
    //   size: (16 / 720) * MediaQuery.of(context).size.height,
    // ),
  );
}
