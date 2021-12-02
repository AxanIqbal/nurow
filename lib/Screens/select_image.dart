import 'package:flutter/material.dart';
import 'package:nurow/Routing/route_names.dart';
import 'package:nurow/Services/database.dart';
import 'package:nurow/Services/navigation_service.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../locator.dart';

class SelectImage extends StatefulWidget {
  const SelectImage({Key? key}) : super(key: key);

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  var isImageSelected = false;
  var imageUrl = '';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          backgroundColor: Colors.grey[400],
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: sizingInformation.isDesktop ? width * 0.4 : width * 0.8,
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: Center(
                        child: isImageSelected
                            ? selectedImage(height, width, imageUrl, context)
                            : Image.network(
                                'https://i.ibb.co/bzyPjVc/X-Icon.png')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isImageSelected) ...{
                        TextButton(
                          onPressed: () async {
                            var result = await showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: FutureBuilder<Map>(
                                    future: DataService().getImageUrl(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return SingleChildScrollView(
                                          child: SizedBox(
                                            height: sizingInformation.isDesktop
                                                ? height * 0.8
                                                : height * 0.9,
                                            width: width * .8,
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        );
                                      }
                                      if (snapshot.connectionState ==
                                              ConnectionState.done &&
                                          snapshot.hasData) {
                                        List<Widget> images = [
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image1"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image2"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image3"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image4"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image2"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image1"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image2"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image3"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image4"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image3"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image1"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image2"],
                                              context),
                                          gridImage(
                                              height,
                                              width,
                                              snapshot.data!["image3"],
                                              context),
                                        ];

                                        return Container(
                                          padding: const EdgeInsets.all(10),
                                          height: sizingInformation.isDesktop
                                              ? height * 0.7
                                              : height * 0.8,
                                          width: width * .8,
                                          child: Column(
                                            children: [
                                              const Text(
                                                "Select a X-Ray for analysis",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Poppins",
                                                  fontSize: 23,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                height: height * 0.55,
                                                width: width * 0.75,
                                                child: GridView.count(
                                                  mainAxisSpacing: 5,
                                                  crossAxisSpacing: 5,
                                                  crossAxisCount:
                                                      sizingInformation.isMobile
                                                          ? 1
                                                          : 3,
                                                  childAspectRatio:
                                                      sizingInformation
                                                              .isDesktop
                                                          ? 1.1
                                                          : 1,
                                                  children: images,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                      return SizedBox(
                                        height: height * 0.7,
                                        width: width * .8,
                                        child: const Center(
                                          child: Text("None"),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                            if (result != null) {
                              setState(() {
                                imageUrl = result;
                                isImageSelected = true;
                              });
                            }
                          },
                          child: const Text(
                            "Select X-Ray",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.resolveWith<
                                    EdgeInsetsGeometry>(
                                (Set<MaterialState> states) {
                              return EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.015,
                              );
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.2);
                                }
                                return Colors
                                    .white; // Use the component's default.
                              },
                            ),
                          ),
                        ),
                      },
                      const SizedBox(
                        width: 15,
                      ),
                      if (!isImageSelected) ...{
                        TextButton(
                          onPressed: () => {
                            locator<NavigationService>().navigateTo(xRayForm)
                          },
                          child: const Text(
                            "Upload X-Ray",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.resolveWith<
                                    EdgeInsetsGeometry>(
                                (Set<MaterialState> states) {
                              return EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.015,
                              );
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.2);
                                }
                                return Colors
                                    .white; // Use the component's default.
                              },
                            ),
                          ),
                        )
                      },
                      if (isImageSelected) ...{
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isImageSelected = false;
                            });
                          },
                          child: const Text(
                            "Go Back",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.resolveWith<
                                    EdgeInsetsGeometry>(
                                (Set<MaterialState> states) {
                              return EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.015,
                              );
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.2);
                                }
                                return Colors
                                    .white; // Use the component's default.
                              },
                            ),
                          ),
                        ),
                      },
                      const SizedBox(
                        width: 15,
                      ),
                      if (isImageSelected) ...{
                        TextButton(
                          onPressed: () {
                            // Navigator.of(context).push(
                            // MaterialPageRoute(
                            // builder: (context) => AnalyseScreen(
                            //   image: imageUrl,
                            // ),
                            // ),
                            // );
                          },
                          child: const Text(
                            "Analyse X-Ray",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.resolveWith<
                                    EdgeInsetsGeometry>(
                                (Set<MaterialState> states) {
                              return EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.015,
                              );
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.2);
                                }
                                return Colors
                                    .white; // Use the component's default.
                              },
                            ),
                          ),
                        ),
                      },
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget gridImage(height, width, url, context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop(url);
    },
    child: Container(
      height: height * 0.17,
      width: width * 0.20,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 5),
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(url)),
      ),
    ),
  );
}

Widget selectedImage(height, width, url, context) {
  return Container(
    height: height * 0.20,
    width: width * 0.22,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blueAccent, width: 5),
      image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(url)),
    ),
  );
}
