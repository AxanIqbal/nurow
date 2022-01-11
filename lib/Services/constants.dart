import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/user.dart';
import 'package:nurow/models/xray.dart';

final patientsRef =
    FirebaseFirestore.instance.collection('patients').withConverter<Patient>(
          fromFirestore: (snapshot, options) => Patient.fromJson({
            ...snapshot.data()!,
            'id': snapshot.id,
          }),
          toFirestore: (patient, options) => patient.toJson(),
        );

final usersRef =
    FirebaseFirestore.instance.collection('users').withConverter<User>(
          fromFirestore: (snapshot, options) => User.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
        );

final patientDemo = Patient(
  name: 'Quentin Beck',
  dob: DateFormat('dd/MM/yyyy').parse('01/06/1964'),
  number: '07907907907',
  address: '20 Ingram Street, London, W1K 1QA',
  xray: [
    Xray(
      originalImage: 'assets/decay_59.JPG',
      radiographType: 'Decay_59',
      timeStamp: DateFormat('dd MMM yyyy').parse('20 Nov 2021'),
      optionalImages: [],
      anatomy: 'assets/Decay_59 anatomy.png',
      annotated: 'assets/Decay_59 annotated.png',
      boneloss: 'assets/Decay_59 boneloss.png',
      labelled: 'assets/Decay-59-LABELLED.png',
      report: 'assets/Report Radiograph decay_59 copy.pdf',
    ),
    Xray(
      originalImage: 'assets/Decay_198.png',
      radiographType: 'Decay_198',
      timeStamp: DateFormat('dd MMM yyyy').parse('20 Nov 2021'),
      optionalImages: [],
      anatomy: 'assets/Decay_198 anatomy.png',
      annotated: 'assets/Decay_198 annotated.png',
      boneloss: 'assets/Decay_198 boneloss.png',
      labelled: 'assets/Decay_198-labelled.png',
      report: 'assets/Report Radiograph decay_198 copy.pdf',
    ),
    Xray(
      originalImage: 'assets/normal_30.jpg',
      radiographType: 'Normal_30',
      timeStamp: DateFormat('dd MMM yyyy').parse('20 Nov 2021'),
      optionalImages: [],
      anatomy: 'assets/Normal_30 anatomy.png',
      annotated: 'assets/Normal_30-annotated.png',
      boneloss: 'assets/Normal_30 boneloss.png',
      labelled: 'assets/Normal_30-labelled.png',
      report: 'assets/Report Radiograph Normal_30 copy.pdf',
    )
  ],
  subXray: [],
);
