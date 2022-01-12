import 'package:cloud_firestore/cloud_firestore.dart';
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
      originalImage: 'assets/A.JPG',
      radiographType: 'Left Bitewing',
      timeStamp: DateFormat('dd MMM yyyy').parse('20 Nov 2021'),
      optionalImages: [],
      anatomy: 'assets/A anatomy.png',
      annotated: 'assets/A-annotated.png',
      boneloss: 'assets/A-boneloss.png',
      labelled: 'assets/A-LABELLED.png',
      caries: 'assets/A caries.JPG',
      charting: 'assets/Charting A.png',
      report: 'assets/Report Radiograph A PDF.pdf',
    ),
    Xray(
      originalImage: 'assets/decay_59.JPG',
      radiographType: 'Left Bitewing',
      timeStamp: DateFormat('dd MMM yyyy').parse('20 Nov 2021'),
      optionalImages: [],
      anatomy: 'assets/Decay_59 anatomy.png',
      annotated: 'assets/Decay_59 annotated.png',
      boneloss: 'assets/Decay_59 boneloss.png',
      labelled: 'assets/Decay_59 Labelled.png',
      caries: 'assets/Decay 59 Caries.JPG',
      charting: 'assets/Charting decay_59.png',
      report: 'assets/Report Radiograph decay_59 PDF.pdf',
    ),
    Xray(
      originalImage: 'assets/Decay_198.png',
      radiographType: 'Left Bitewing',
      timeStamp: DateFormat('dd MMM yyyy').parse('20 Nov 2021'),
      optionalImages: [],
      anatomy: 'assets/Decay_198 anatomy.png',
      annotated: 'assets/Decay 198 annotated.JPG',
      boneloss: 'assets/Decay_198 boneloss.png',
      labelled: 'assets/Decay_198-labelled.png',
      caries: 'assets/Decay 198 caries.JPG',
      charting: 'assets/Charting decay_198.png',
      report: 'assets/Report Radiograph decay_198 PDF.pdf',
    ),
    Xray(
      originalImage: 'assets/normal_30.jpg',
      radiographType: 'Left Bitewing',
      timeStamp: DateFormat('dd MMM yyyy').parse('20 Nov 2021'),
      optionalImages: [],
      anatomy: 'assets/Normal_30 anatomy.png',
      annotated: 'assets/Normal 30 annotated.JPG',
      boneloss: 'assets/Normal_30 boneloss.png',
      labelled: 'assets/Normal_30-labelled.png',
      caries: 'assets/Normal 30 caries.JPG',
      charting: 'assets/Charting Normal_30.png',
      report: 'assets/Report Radiograph Normal_30 copy.pdf',
    )
  ],
  subXray: [],
);
