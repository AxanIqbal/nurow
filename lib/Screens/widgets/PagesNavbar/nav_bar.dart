import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nurow/Routing/route_names.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:nurow/locator.dart';

class PagesNavBar extends StatelessWidget {
  const PagesNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.17,
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
              height: 100,
              width: 100,
              child: Image.network("https://i.ibb.co/bzyPjVc/X-Icon.png"),
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
            "",
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
              debugPrint(FirebaseAuth.instance.currentUser!.displayName);
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.displayName)
                  .update({
                'lastLogOutTime': FieldValue.arrayUnion([Timestamp.now()])
              }).then((value) => FirebaseAuth.instance.signOut(),
                      onError: (error) {
                log(error);
              });
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
    onTap: () => locator<NavigationService>().navigateTo(routeName),
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
      width: MediaQuery.of(context).size.width * 0.02,
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
