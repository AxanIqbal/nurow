import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/Screens/Substrative/bindings/subform_binding.dart';
import 'package:nurow/Screens/Substrative/form.dart';

class SelectSubAnalysis extends GetResponsiveView {
  SelectSubAnalysis({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: screen.responsiveValue(
            desktop: screen.width * 0.4,
            tablet: screen.width * 0.5,
            mobile: screen.width * 0.8,
            watch: screen.width,
          ),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Subtractive analysis",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                height: 200,
                child: Center(
                  child: Image.network('https://i.ibb.co/bzyPjVc/X-Icon.png'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => {},
                    child: const Text(
                      "Select X-Ray",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                              (Set<MaterialState> states) {
                        return EdgeInsets.symmetric(
                          horizontal: screen.width * 0.03,
                          vertical: screen.height * 0.015,
                        );
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Get.theme.colorScheme.primary
                                .withOpacity(0.2);
                          }
                          return Colors.white; // Use the component's default.
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        () => const SubForm(),
                        binding: SubFormBinding(),
                      );
                    },
                    child: const Text(
                      "Upload X-Ray",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                              (Set<MaterialState> states) {
                        return EdgeInsets.symmetric(
                          horizontal: screen.width * 0.03,
                          vertical: screen.height * 0.015,
                        );
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Get.theme.colorScheme.primary
                                .withOpacity(0.2);
                          }
                          return Colors.white; // Use the component's default.
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
