import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nurow/models/patient.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> masterPDF(PdfPageFormat format, Patient patient) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);
  final heading = pw.MemoryImage(
    (await rootBundle.load('assets/pdf_heading.png')).buffer.asUint8List(),
  );
  final foreignStructure = pw.MemoryImage(
    (await rootBundle.load('assets/foriegn structures.png'))
        .buffer
        .asUint8List(),
  );
  final boneLevel = pw.MemoryImage(
    (await rootBundle.load('assets/bone-level.png')).buffer.asUint8List(),
  );
  final decay1 = pw.MemoryImage(
    (await rootBundle.load('assets/pdf_decay1.png')).buffer.asUint8List(),
  );
  final decay2 = pw.MemoryImage(
    (await rootBundle.load('assets/pdf_decay2.png')).buffer.asUint8List(),
  );
  final decay3 = pw.MemoryImage(
    (await rootBundle.load('assets/pdf_decay3.png')).buffer.asUint8List(),
  );
  final decay4 = pw.MemoryImage(
    (await rootBundle.load('assets/pdf_decay4.png')).buffer.asUint8List(),
  );
  final decay5 = pw.MemoryImage(
    (await rootBundle.load('assets/pdf_decay5.png')).buffer.asUint8List(),
  );
  final decay6 = pw.MemoryImage(
    (await rootBundle.load('assets/pdf_decay6.png')).buffer.asUint8List(),
  );
  final angularBoneLoss = pw.MemoryImage(
    (await rootBundle.load('assets/pdf_angular bone-loss.png'))
        .buffer
        .asUint8List(),
  );

  pw.Table _imageTable(pw.MemoryImage image) {
    return pw.Table(
      border: pw.TableBorder.all(),
      children: [
        pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(5.0),
              child: pw.Text('Image'),
            ),
            pw.SizedBox(
              width: 10 * PdfPageFormat.cm,
              child: pw.Padding(
                padding: const pw.EdgeInsets.all(5.0),
                child: pw.Expanded(
                  child: pw.Image(image),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  pw.Table _imageTableRow(pw.MemoryImage image1, pw.MemoryImage image2) {
    return pw.Table(
      border: pw.TableBorder.all(),
      children: [
        pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(5.0),
              child: pw.Text('Image'),
            ),
            pw.SizedBox(
              width: 10 * PdfPageFormat.cm,
              child: pw.Padding(
                padding: const pw.EdgeInsets.all(5.0),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Image(
                        image1,
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Image(
                        image2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  doc.addPage(
    pw.Page(
      build: (context) => pw.Column(
        children: [
          pw.Image(heading),
          pw.SizedBox(
            height: 5.0 * PdfPageFormat.mm,
          ),
          pw.Text(
            "Report",
            style: pw.Theme.of(context).header1.copyWith(
                  fontWeight: pw.FontWeight.bold,
                  decoration: pw.TextDecoration.underline,
                ),
          ),
          pw.Text(
            DateFormat("dd MMM yyyy").format(DateTime.now()).toString(),
          )
        ],
      ),
    ),
  );

  doc.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Patient Summary : ${patient.name}',
              style: pw.Theme.of(context).header0),
          pw.SizedBox(height: 40),
          pw.Text("Name: ${patient.name}"),
          pw.Text(
            "Date Of Birth: ${DateFormat("dd-MMM-yyyy").format(patient.dob).toString()}",
          ),
          pw.Text("Address: ${patient.address}"),
          pw.Text("Telephone: ${patient.number}"),
        ],
      ),
    ),
  );

  doc.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Radiograph Analysis', style: pw.Theme.of(context).header0),
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
                pw.Text('1. Tooth Identification'),
                pw.Text('2. Natural Anatomy Analysis'),
                pw.Text('3. Foreign Structures Analysis'),
                pw.Text('4. Diagnosis Analysis'),
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                    bottom: 2.0 * PdfPageFormat.mm,
                    left: 5.0 * PdfPageFormat.mm,
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('a. Caries (Decay) Analysis'),
                      pw.Text('b. Bone Loss Analysis'),
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
        pw.Text(
          'Analysis Summary',
          style: pw.Theme.of(context).header0.copyWith(
                decoration: pw.TextDecoration.underline,
              ),
        ),
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
            <String>['UL5', 'E,D,P,CEJ', 'Restoration', 'Decay'],
            <String>[
              'UL6',
              'E,D,CEJ',
              'Restoration, Root canal treatment, Post',
              'Nil'
            ],
            <String>['UL7', 'E,D,P,CEJ', 'NIL', 'Bone Loss'],
          ],
        ),
        _imageTable(foreignStructure),
        // pw.SizedBox(height: 20),
        // pw.Text('Image', style: pw.Theme.of(context).header0),
        // pw.Image(foriegn_structure),
        pw.SizedBox(height: 20),
        pw.Text(
          'Caries (Decay) Report',
          style: pw.Theme.of(context).header0.copyWith(
                decoration: pw.TextDecoration.underline,
              ),
        ),
        pw.SizedBox(height: 20),
        pw.Text('Patient Risk factors:'),
        pw.Text('Medical History: Diabetic,'),
        pw.Text('Diet: High Sugar Frequency'),
        pw.Text('% filled teeth on image (historical risk)'),
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
              'Crowding, Poor margin',
              '95%'
            ],
          ],
        ),
        _imageTableRow(decay1, decay2),
        // imageTable(foreignStructure),
        pw.Table(
          border: pw.TableBorder.all(),
          children: [
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Text('LL7'),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Text('Proximal'),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Text('Dentine'),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Text('Poor Contact Point'),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Text('99%'),
                ),
              ],
            ),
          ],
        ),
        _imageTableRow(decay3, decay4),
        // imageTable(foreignStructure),
        pw.Table(
          border: pw.TableBorder.all(),
          children: [
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Text('UL4'),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Text('Proximal'),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Text('Dentine'),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Text('NIL'),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Text('98%'),
                ),
              ],
            ),
          ],
        ),
        _imageTableRow(decay5, decay6),
        pw.SizedBox(height: 20),
        pw.Text(
          'Bone-loss Report',
          style: pw.Theme.of(context).header0.copyWith(
                decoration: pw.TextDecoration.underline,
              ),
        ),
        pw.SizedBox(height: 20),
        pw.Text('Diagnosis:'),
        pw.Text('Generalized Mild horizontal bone-loss'),
        pw.Text('Angular bone loss associated with LL5'),
        pw.SizedBox(height: 20),
        pw.Text('Patient Risk Factors:'),
        pw.Text('SH: Smoker 10/day'),
        pw.Text('MH: Diabetes'),
        pw.Text('OH regime: No interdental cleaning '),
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
        _imageTable(boneLevel),
        pw.SizedBox(height: 20),
        pw.Text(
          'Angular bone-loss',
          style: pw.Theme.of(context).header0.copyWith(
                decoration: pw.TextDecoration.underline,
              ),
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
              'N',
              '99%'
            ],
          ],
        ),
        _imageTable(angularBoneLoss),
        pw.SizedBox(height: 20),
      ],
    ),
  );

  return await doc.save();
}
