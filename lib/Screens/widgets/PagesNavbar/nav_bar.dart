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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network("https://i.ibb.co/bzyPjVc/X-Icon.png"),
          ),
          navbarItem("Analyse X-Ray", Icons.analytics_outlined, analysisPage),
          navbarItem("Substractive Imagery", Icons.analytics_rounded, ""),
          navbarItem("Pathology Inv...", Icons.home_max_rounded, ""),
          navbarItem("Patient Data", Icons.people, patientDetailsPage),
          navbarItem("User Management", Icons.supervised_user_circle, ""),
          navbarItem("Audit", Icons.check_box, auditPage),
          navbarItem("License Management", Icons.pages, ""),
          navbarItem("Support", Icons.support, ""),
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
                print(error);
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

Widget navbarItem(String name, IconData icon, String routeName) {
  return InkWell(
    onTap: () {
      locator<NavigationService>().navigateTo(routeName);
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 10),
        Icon(
          icon,
          color: Colors.white,
        )
      ],
    ),
  );
}
