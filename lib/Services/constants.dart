import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/user.dart';
import 'package:nurow/models/xray.dart';
import 'package:nurow/models/xray_category.dart';

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
      anatomy: XrayCategory(
        description: 'description',
        image: 'assets/A anatomy.png',
        table: [
          ['UL3', 'F,D,P', ''],
          ['UL4', 'E,D,P,CEJ', ''],
          ['UL5', 'F,D,P,CEJ', ''],
          ['UL6', '', 'Restoration, Implant'],
          ['UL7', 'F,D,P,CEJ', ''],
          ['UL3', 'F,D,P,CEJ', ''],
          ['UL4', 'F,D,P,CEJ', ''],
          ['UL5', 'F,D,P,CEJ', ''],
          ['UL6', '', 'Restoration, Implant'],
          ['UL7', 'F,D,P,CEJ', ''],
        ],
      ),
      annotated: XrayCategory(
        description: 'description',
        image: 'assets/A-annotated.png',
        table: [
          ['UL3', '', 'Caries'],
          ['UL4', '', 'Caries'],
          ['UL5', '', ''],
          ['UL6', 'Restoration, Implant', ''],
          ['UL7', 'Restoration', 'Marginal discrepancy'],
          ['UL3', '', ''],
          ['UL4', '', ''],
          ['UL5', '', ''],
          ['UL6', 'Restoration, Implant', ''],
          ['UL7', 'Restoration', 'Caries'],
        ],
      ),
      boneloss: XrayCategory(
        description: 'description',
        image: 'assets/A-boneloss.png',
        data: {
          'Diagnosis': '''Generalized Mild-early moderate horizontal bone-loss
Angular bone loss associated with UL4''',
          'Data': '''10 teeth identified on original image

Number of CEJ reference point identified: 12
(Reference point for original bone level)

Impediments to original bone level projection: (Adjusted confidence in the projection)
5 Overlapping teeth on image.
1 Caries obstruction
2 Implants

Overall Confidence in findings: 96%''',
          'Adjunctive': '''Patient Risk Factors: 
SH: Smoker 10/day 
MH: Diabetes 
OH regime: No interdental cleaning'''
        },
      ),
      labelled: XrayCategory(
          description: 'description',
          image: 'assets/A-LABELLED.png',
          table: [
            ['UL3', 'Partial', '50%'],
            ['UL4', 'Full', '100%'],
            ['UL5', 'Full', '100%'],
            ['UL6', 'Full', '100%'],
            ['UL7', 'Full', '100%'],
            ['UL3', 'Partial', '30%'],
            ['UL4', 'Partial', '70%'],
            ['UL5', 'Full', '100%'],
            ['UL6', 'Full', '100%'],
            ['UL7', 'Full', '100%'],
          ]),
      caries: XrayCategory(
        description: 'description',
        image: 'assets/A caries.JPG',
        data: {
          'Data': '''10 teeth identified on original image
Number of potential decayed teeth in the image: 3
Number of restored teeth in the image: 4
40% restored teeth on image (historical risk) [Fillings: Unrestored teeth]''',
          'Adjunctive': '''Patient Risk factors: 
Medical History: Diabetes
Diet: High Sugar Frequency 
OH regime: No interdental cleaning'''
        },
        table: [
          [
            'Ul3',
            'Proximal',
            'Dentine',
            '''Irregular shaped radiolucency.
Enamel blunting at CEJ.
Diabetic.
High Sugar Frequency reported.
40% image restoration rate.
No interdental cleaning reported''',
            '',
            '87%',
          ],
          [
            'Ul4',
            'Proximal',
            'Dentine',
            '''Open contact point.
Mirror caries on adjacent tooth.
Diabetic.
High Sugar Frequency reported.
40% image restoration rate.
No interdental cleaning reported''',
            'Enamel Knife edge shape at CEJ intact.',
            '7%',
          ],
          [
            'Ul7',
            'Proximal',
            'Dentine',
            '''Irregular shaped radiolucency.
Enamel blunting at CEJ.
Diabetic.
High Sugar Frequency reported.
Tilted tooth.
Potential food trap gap.
No interdental cleaning reported''',
            '',
            '96%',
          ],
        ],
      ),
      charting: 'assets/Charting A.png',
      report: 'assets/Report Radiograph A PDF.pdf',
    ),
    Xray(
      originalImage: 'assets/decay_59.JPG',
      radiographType: 'Left Bitewing',
      timeStamp: DateFormat('dd MMM yyyy').parse('20 Nov 2021'),
      optionalImages: [],
      anatomy: XrayCategory(
        description: 'description',
        image: 'assets/Decay_59 anatomy.png',
        table: [
          ['UNKNOWN', 'E,D,CEJ', ''],
          ['UL4', 'E,D,P,CEJ', ''],
          ['UL5', 'E,D,P,CEJ', ''],
          ['UL6', 'E,D,P,CEJ', ''],
          ['UL7', 'E,D,P,CEJ', ''],
          ['LL4', 'E,D,P,CEJ', ''],
          ['LL5', 'E,D,P,CEJ', ''],
          ['LL6', 'E,D,P,CEJ', ''],
          ['LL7', 'E,D,P,CEJ', ''],
        ],
      ),
      annotated: XrayCategory(
        description: 'description',
        image: 'assets/Decay_59 annotated.png',
        table: [
          ['UL4', 'Restoration  Caries', ''],
          ['UL5', 'Restoration  Caries, Marginal discrepancy', ''],
          ['UL6', 'Restoration  Marginal discrepancy', ''],
          ['UL7', '', ''],
          ['LL4', '', ''],
          ['LL5', '', ''],
          ['LL6', '', 'Caries'],
          ['LL7', '', 'Caries'],
        ],
      ),
      boneloss: XrayCategory(
        description: 'description',
        image: 'assets/Decay_59 boneloss.png',
        data: {
          'Diagnosis':
              '''General Good Crestal bone levels - Within accepted normal region''',
          'Data': '''8 teeth identified on original image

Number of CEJ reference point identified: 15
(Reference point for original bone level)

Impediments to original bone level projection: (Adjusted confidence in the projection)
4 Overlapping teeth on image.
2 Caries obstruction

Overall Confidence in findings: 98%''',
          'Adjunctive': '''Patient Risk Factors: 
SH: Smoker 10/day 
MH: NIL
OH regime: Rare interdental cleaning'''
        },
      ),
      labelled: XrayCategory(
        description: 'description',
        image: 'assets/Decay_59 Labelled.png',
        table: [
          ['UNKNOWN', 'Partial', '100%'],
          ['UL4', 'Full', '100%'],
          ['UL5', 'Full', '100%'],
          ['UL6', 'Full', '100%'],
          ['UL7', 'Full', '100%'],
          ['LL4', 'Full', '99%'],
          ['LL5', 'Full', '100%'],
          ['LL6', 'Full', '100%'],
          ['LL7', 'Full', '100%'],
        ],
      ),
      caries: XrayCategory(
        description: 'description',
        image: 'assets/Decay 59 Caries.JPG',
        data: {
          'Data': '''8 teeth identified on original image
Number of potential decayed teeth in the image: 4
Number of restored teeth in the image: 3
37.5% restored teeth on image (historical risk) [Fillings: Unrestored teeth]''',
          'Adjunctive': '''Patient Risk factors: 
Medical History: NIL
Diet: High Sugar Frequency 
OH regime: Rare interdental cleaning'''
        },
        table: [
          [
            'UL4',
            'Proximal',
            'Dentine',
            '''Irregular shaped radiolucency.
Poor contact point.
Mirror caries on adjacent tooth.
Rare interdental cleaning reported.
High Sugar frequency reported.
37.5% restored teeth on image (historical risk)''',
            '',
            '93%',
          ],
          [
            'UL5',
            'Proximal',
            'Dentine',
            '''Irregular shaped radiolucency.
Poor contact point.
Mirror caries on adjacent tooth.
Rare interdental cleaning reported.
High Sugar frequency reported.
37.5% restored teeth on image (historical risk)''',
            '',
            '94%',
          ],
          [
            'LL6',
            'Proximal',
            'Enamel',
            '''Wedge shaped radiolucency.
At contact point.
No interdental cleaning reported.
High Sugar frequency reported. 
37.5% restored teeth on image (historical risk)''',
            '''Overlap on image.
Check additional views if available!''',
            '12%',
          ],
          [
            'LL7',
            'Proximal',
            'Enamel',
            '''Wedge shaped radiolucency.
At contact point
No interdental cleaning reported
High Sugar frequency reported 
37.5% restored teeth on image (historical risk)''',
            '''Overlap on image.
Check additional views if available!''',
            '9%',
          ],
        ],
      ),
      charting: 'assets/Charting decay_59.png',
      report: 'assets/Report Radiograph decay_59 PDF.pdf',
    ),
    Xray(
      originalImage: 'assets/Decay_198.png',
      radiographType: 'Left Bitewing',
      timeStamp: DateFormat('dd MMM yyyy').parse('20 Nov 2021'),
      optionalImages: [],
      anatomy: XrayCategory(
        description: 'description',
        image: 'assets/Decay_198 anatomy.png',
        table: [
          ['UL4', 'D,P', ''],
          ['UL5', 'D,P', ''],
          ['UL6', 'E,D,P,CEJ', ''],
          ['UL7', 'E,D,P,CEJ', ''],
          ['LL4', 'P', ''],
          ['LL5', '', 'Pontic'],
          ['LL6', 'D,P', ''],
          ['LL7', 'E,D,P,CEJ', ''],
        ],
      ),
      annotated: XrayCategory(
        description: 'description',
        image: 'assets/Decay 198 annotated.JPG',
        table: [
          ['UL4', 'Crown', 'Overhang'],
          ['UL5', 'Crown', ''],
          ['UL6', '', 'Caries'],
          ['UL7', 'Restoration', 'Caries'],
          ['LL4', 'Crown (Abutment)', ''],
          ['LL5', 'Pontic', ''],
          ['LL6', 'Crown (Abutment)', 'Overhang'],
          ['LL7', 'Restoration', ' Caries/Cervical burnout'],
        ],
      ),
      boneloss: XrayCategory(
        description: 'description',
        image: 'assets/Decay_198 boneloss.png',
        data: {
          'Diagnosis': '''Generalized mild to moderate horizontal bone-loss
Furcal bone loss associated with UL6, LL6''',
          'Data': '''8 teeth identified on original image

Number of CEJ reference point identified: 6
(Reference point for original bone level)

Impediments to original bone level projection: (Adjusted confidence in the projection)
4 Overlapping teeth on image.
2 Caries obstruction
5 Restorative obstructions

Overall Confidence in findings: 97%''',
          'Adjunctive': '''Patient Risk Factors: 
SH: Smoker 10/day 
MH: Diabetes 
OH regime: Rare interdental cleaning'''
        },
      ),
      labelled: XrayCategory(
        description: 'description',
        image: 'assets/Decay_198-labelled.png',
        table: [
          ['UL4', 'Partial', '98%'],
          ['UL5', 'Full', '100%'],
          ['UL6', 'Full', '100%'],
          ['UL7', 'Full', '100%'],
          ['LL4', 'Partial', '92%'],
          ['LL5', 'Full', '100%'],
          ['LL6', 'Full', '100%'],
          ['LL7', 'Full', '100%'],
        ],
      ),
      caries: XrayCategory(
        description: 'description',
        image: 'assets/Decay 198 caries.JPG',
        data: {
          'Data': '''8 teeth identified on original image
Number of potential decayed teeth in the image: 3
Number of restored teeth in the image: 7
87.5% restored teeth on image (historical risk) [Fillings: Unrestored teeth]''',
          'Adjunctive': '''Patient Risk factors: 
Medical History: Diabetes
Diet: High Sugar Frequency 
OH regime: ETB x2, Rare interdental cleaning'''
        },
        table: [
          [
            'UL6',
            'Proximal',
            'Dentine',
            '''Mirror caries adjacent tooth.
Blunting enamel at CEJ.
Rare interdental cleaning reported.
High sugar frequency reported.
Irregular shaped radiolucency.
87.5% image restoration rate''',
            '''Overlap on image.
Check additional views if available!''',
            '87%',
          ],
          [
            'UL7',
            'Proximal',
            'Pulp',
            '''Mirror caries adjacent tooth.
Blunting enamel at CEJ.
Rare interdental cleaning reported.
High sugar frequency reported
Irregular shaped radiolucency.
87.5% image restoration rate.''',
            '',
            '98%',
          ],
          [
            'LL7',
            'Proximal',
            'Dentine',
            '''Overhang adjacent tooth.
Early bone loss.
87.5% image restoration rate.
Potential food trap gap''',
            '''Enamel intact at CEJ
Close to alveolar crest.
Check additional views if available!''',
            '6%',
          ],
        ],
      ),
      charting: 'assets/Charting decay_198.png',
      report: 'assets/Report Radiograph decay_198 PDF.pdf',
    ),
    Xray(
      originalImage: 'assets/normal_30.jpg',
      radiographType: 'Left Bitewing',
      timeStamp: DateFormat('dd MMM yyyy').parse('20 Nov 2021'),
      optionalImages: [],
      anatomy: XrayCategory(
        description: 'description',
        image: 'assets/Normal_30 anatomy.png',
      ),
      annotated: XrayCategory(
        description: 'description',
        image: 'assets/Normal 30 annotated.JPG',
      ),
      boneloss: XrayCategory(
        description: 'description',
        image: 'assets/Normal_30 boneloss.png',
      ),
      labelled: XrayCategory(
        description: 'description',
        image: 'assets/Normal_30-labelled.png',
      ),
      caries: XrayCategory(
        description: 'description',
        image: 'assets/Normal 30 caries.JPG',
      ),
      charting: 'assets/Charting Normal_30.png',
      report: 'assets/Report Radiograph Normal_30 PDF.pdf',
    )
  ],
  subXray: [],
);
