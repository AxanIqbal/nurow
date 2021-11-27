import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PracticePatients extends StatefulWidget {
  const PracticePatients({Key? key}) : super(key: key);

  @override
  _PracticePatientsState createState() => _PracticePatientsState();
}

class _PracticePatientsState extends State<PracticePatients> {
  String? _chosenValue;

  late DateTime selectedDate1;
  late DateTime selectedDate2;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Center(
        child: Container(
          width: width - width - 0.17,
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Practice Data Patients",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: width * 0.7,
                height: height * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Select Pathology",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButton<String>(
                          focusColor: Colors.black,
                          value: _chosenValue,

                          //elevation: 5,
                          style: const TextStyle(color: Colors.black),
                          iconEnabledColor: Colors.black,
                          items: <String>[
                            'Activity 1',
                            'Activity 2',
                            'Activity 3',
                            'Activity 4',
                            'Activity 5',
                            'Activity 6',
                            'Activity 7',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          hint: const Text(
                            "Please choose...",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _chosenValue = value;
                            });
                            log(_chosenValue.toString());
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Demographic",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButton<String>(
                          focusColor: Colors.black,
                          value: _chosenValue,

                          //elevation: 5,
                          style: const TextStyle(color: Colors.black),
                          iconEnabledColor: Colors.black,
                          items: <String>[
                            'Activity 1',
                            'Activity 2',
                            'Activity 3',
                            'Activity 4',
                            'Activity 5',
                            'Activity 6',
                            'Activity 7',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          hint: const Text(
                            "Please choose...",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _chosenValue = value;
                            });
                            log(_chosenValue.toString());
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      // color: Colors.black,
                      height: height * 0.3,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 300,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime(1969, 1, 1),
                              onDateTimeChanged: (DateTime newDateTime) {
                                // Do something
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "TO",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 100,
                            width: 300,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime(1969, 1, 1),
                              onDateTimeChanged: (DateTime newDateTime) {
                                // Do something
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                          (Set<MaterialState> states) {
                    return EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                      vertical: height * 0.015,
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
                      return Colors.black; // Use the component's default.
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
