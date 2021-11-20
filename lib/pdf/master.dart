import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:nurow/models/xray.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> masterPDF(PdfPageFormat format, Xray patient) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);

  doc.addPage(
    pw.Page(
      build: (context) => pw.Column(
        children: [
          pw.Text('Nurow Report', style: pw.Theme.of(context).header0),
          pw.Text(
            DateFormat("dd MMM yyyy").format(DateTime.now()).toString(),
          )
        ],
      ),
    ),
  );

  doc.addPage(pw.Page(
    build: (context) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Patient Summary', style: pw.Theme.of(context).header0),
        pw.SizedBox(height: 40),
        pw.Text('Patient Static', style: pw.Theme.of(context).header1),
        pw.SizedBox(height: 20),
        pw.Text("Name: ${patient.name}"),
        pw.Text("Number: ${patient.number}"),
        pw.Text(
            "Date Of Birth: ${DateFormat("dd-MMM-yyyy").format(patient.dob).toString()}"),
        pw.Text("Address: ${patient.address}"),
      ],
    ),
  ));

  doc.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('X Ray Analysis', style: pw.Theme.of(context).header0),
          pw.SizedBox(height: 40),
          pw.Text('Analysis Completed', style: pw.Theme.of(context).header1),
          pw.SizedBox(height: 20),
          pw.Container(
            margin: const pw.EdgeInsets.only(
              bottom: 2.0 * PdfPageFormat.mm,
              left: 5.0 * PdfPageFormat.mm,
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('1.Tooth Identification'),
                pw.Text('2.Natural Anatomy Analysis'),
                pw.Text('3.Foreign Structures Analysis'),
                pw.Text('4.Diagnosis Analysis'),
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                    bottom: 2.0 * PdfPageFormat.mm,
                    left: 5.0 * PdfPageFormat.mm,
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('a.Decay Analysis'),
                      pw.Text('b.Bone Loss Analysis'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // pw.DefaultTextStyle(
          //     child: pw.Column(
          //       children: [],
          //     ),
          //     style: const pw.TextStyle())
        ],
      ),
    ),
  );

  doc.addPage(
    pw.MultiPage(
      orientation: pw.PageOrientation.portrait,
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      build: (context) => [
        pw.Text('Analysis Summary', style: pw.Theme.of(context).header0),
        pw.SizedBox(height: 20),
        pw.Table.fromTextArray(
          context: context,
          data: const <List<String>>[
            <String>[
              'Total Number',
              'Natural structures Identified',
              'Foreign structures Identified',
              'Pathology Identified'
            ],
            <String>[
              'UL5',
              'E,D,P,CEJ',
              'Restoration, Root canal treatment, Post',
              'Decay'
            ],
            <String>[
              'UL6',
              'E,D,P,CEJ',
              'Restoration, Root canal treatment, Post',
              'Nil'
            ],
            <String>[
              'UL7',
              'E,D,P,CEJ',
              'Restoration, Root canal treatment, Post',
              'Bone Loss'
            ],
          ],
        ),
        pw.SizedBox(height: 20),
        pw.Text('Decay Report', style: pw.Theme.of(context).header0),
        pw.SizedBox(height: 20),
        pw.Text('Patient Risk factors: Diabetic (Medical Data)'),
        pw.Text('Diet: High Sugar Frequency (Medical Data)'),
        pw.Text('MH: Diabetic, ... (Medical Data)'),
        pw.Text('% filled teeth on image: (#fillings / #teeth)'),
        pw.SizedBox(height: 20),
        pw.Text('Decay LL6 (xRayAnalysis collection)',
            style: pw.Theme.of(context).header0),
        pw.SizedBox(height: 20),
        pw.Table.fromTextArray(
          context: context,
          data: const <List<String>>[
            <String>[
              'Total Number',
              'Position on Tooth',
              'Advancement Level',
              'Impediments',
              'Confidence %',
            ],
            <String>[
              'LL6',
              'Proximal',
              'Enamel',
              'Crowding, poor margin',
              '98%'
            ],
          ],
        ),
        pw.SizedBox(height: 20),
        pw.Text('Decay LL8', style: pw.Theme.of(context).header0),
        pw.SizedBox(height: 20),
        pw.Table.fromTextArray(
          context: context,
          data: const <List<String>>[
            <String>[
              'Total Number',
              'Position on Tooth',
              'Advancement Level',
              'Impediments',
              'Confidence %',
            ],
            <String>[
              'LL6',
              'Proximal',
              'Enamel',
              'Crowding, poor margin',
              '98%'
            ],
          ],
        ),
        pw.SizedBox(height: 20),
        pw.Text('Boneloss Report', style: pw.Theme.of(context).header0),
        pw.SizedBox(height: 20),
        pw.Text('Diagnosis:'),
        pw.Text('Generalized Mild horizontal bone-loss'),
        pw.Text('Angular bone loss associated with LL5'),
        pw.SizedBox(height: 20),
        pw.Text('Patient Risk Factors:'),
        pw.Text('SH'),
        pw.Text('MH'),
        pw.Text('OH regime'),
        pw.SizedBox(height: 20),
        pw.Table.fromTextArray(
          context: context,
          data: const <List<String>>[
            <String>[
              'Total Number of Teeth identified on Xray',
              'CEJ reference points identified',
              'Current bone level tracing confidence %',
              'Impediments identified',
              'Confidence % in diagnosis',
            ],
            <String>['8', '14', '99%', 'Crowding', '99%'],
          ],
        ),
        pw.SizedBox(height: 20),
        pw.Table.fromTextArray(
          context: context,
          data: const <List<String>>[
            <String>[
              'Total Number',
              'Position on Angular bone-loss',
              'Furcal bone-loss',
              'Impediments',
              'Calculus detected',
              'Confidence %',
            ],
            <String>[
              'LL5',
              'Mesial',
              'Nil',
              'Crowding, Overhanging restoration',
              'Y',
              '98%'
            ],
          ],
        ),
        pw.SizedBox(height: 20),
      ],
    ),
  );

  return await doc.save();
}
