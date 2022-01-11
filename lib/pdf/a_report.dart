import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nurow/models/patient.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> aReport(PdfPageFormat format, Patient patient) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);
  final heading = pw.MemoryImage(
    (await rootBundle.load('assets/pdf_heading.png')).buffer.asUint8List(),
  );
  final aLabelled = pw.MemoryImage(
    (await rootBundle.load('assets/A-LABELLED.png')).buffer.asUint8List(),
  );
  final aAnnoted = pw.MemoryImage(
    (await rootBundle.load('assets/A-annotated.png')).buffer.asUint8List(),
  );
  final aBoneloss = pw.MemoryImage(
    (await rootBundle.load('assets/A-boneloss.png')).buffer.asUint8List(),
  );
  final aAnatomy = pw.MemoryImage(
    (await rootBundle.load('assets/A anatomy.png')).buffer.asUint8List(),
  );

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
              width: 7.5 * PdfPageFormat.cm,
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
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Image(heading),
          pw.SizedBox(
            height: 5.0 * PdfPageFormat.mm,
          ),
          pw.Center(
            child: pw.Text(
              "Report",
              style: pw.Theme.of(context).header1.copyWith(
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),
            ),
          ),
          pw.SizedBox(
            height: 5.0 * PdfPageFormat.mm,
          ),
          pw.Text(
            DateFormat("dd MMM yyyy").format(DateTime.now()).toString(),
          ),
          pw.SizedBox(
            height: 10.0 * PdfPageFormat.mm,
          ),
          pw.Text(
            'Patient Summary',
            style: pw.Theme.of(context).header0,
          ),
          pw.SizedBox(
            height: 10.0 * PdfPageFormat.mm,
          ),
          pw.Table(
            columnWidths: const {
              0: pw.FlexColumnWidth(1),
              1: pw.FlexColumnWidth(4),
            },
            children: [
              pw.TableRow(
                children: [
                  pw.Text('Name:'),
                  pw.Text(patient.name),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Text('Date Of Birth:'),
                  pw.Text(
                      DateFormat("dd/MM/yyyy").format(patient.dob).toString()),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Text('Address:'),
                  pw.Text(patient.address),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Text('Telephone:'),
                  pw.Text(patient.number),
                ],
              ),
            ],
          ),
          pw.SizedBox(
            height: 10.0 * PdfPageFormat.mm,
          ),
          pw.Text(
            'Radiograph Analysis',
            style: pw.Theme.of(context).header0,
          ),
          pw.SizedBox(
            height: 10.0 * PdfPageFormat.mm,
          ),
          pw.Text(
            'Analysis Completed',
            style: pw.Theme.of(context).header1,
          ),
          pw.SizedBox(
            height: 10.0 * PdfPageFormat.mm,
          ),
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
        ],
      ),
    ),
  );

  doc.addPage(pw.Page(
    build: (context) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(
          height: 5.0 * PdfPageFormat.mm,
        ),
        pw.Text(
          "Analysis Summary",
          style: pw.Theme.of(context).header0.copyWith(
                fontWeight: pw.FontWeight.bold,
                decoration: pw.TextDecoration.underline,
              ),
        ),
        pw.SizedBox(
          height: 5.0 * PdfPageFormat.mm,
        ),
        pw.Table.fromTextArray(
          data: const <List<String>>[
            <String>[
              'Tooth Number			',
              'Natural structures identified',
              'Foreign structures Identified',
              'Pathology Identified/ Notes',
            ],
            <String>['UL3', 'F,D,P', '', 'Caries, Bone-loss'],
            <String>['UL4', 'F,D,P,CEJ', '', 'Caries, Bone-loss'],
            <String>['UL5', 'F,D,P,CEJ', '', 'Bone-loss'],
            <String>['UL6', '', 'Restoration, Implant', ''],
            <String>[
              'UL7',
              'F,D,P,CEJ',
              'Restoration',
              'Marginal Discrepancy?, Bone-loss'
            ],
            <String>['UL3', 'F,D,P,CEJ', '', 'Bone-loss'],
            <String>['UL4', 'F,D,P,CEJ', '', 'Bone-loss'],
            <String>['UL5', 'F,D,P,CEJ', '', 'Bone-loss'],
            <String>['UL6', '', 'Restoration, Implant', ''],
            <String>['UL7', 'F,D,P,CEJ', 'Restoration', 'Caries, Bone-loss'],
          ],
        ),
        _imageTableRow(aLabelled, aAnnoted),
      ],
    ),
  ));

  doc.addPage(
    pw.MultiPage(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      build: (context) => [
        pw.Text(
          'Caries (Decay) Report',
          style: pw.Theme.of(context).header0.copyWith(
                decoration: pw.TextDecoration.underline,
              ),
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Text('Patient Risk factors:'),
        pw.Text('Medical History: Diabetes'),
        pw.Text('Diet: High Sugar Frequency'),
        pw.Text(
            '40% restored teeth on image (historical risk) [Fillings: Unrestored teeth]'),
        pw.SizedBox(height: 10.0 * PdfPageFormat.mm),
        pw.Table.fromTextArray(
          defaultColumnWidth: const pw.FixedColumnWidth(200),
          context: context,
          cellAlignment: pw.Alignment.center,
          data: const <List<String>>[
            <String>[
              'Total Number',
              'Position on Tooth',
              'Advancement Level',
              'Impediments',
              'Uncertainties',
              'Confidence %',
            ],
            <String>[
              'LL3',
              'Proximal',
              'Dentine',
              'Irregular shaped radiolucency.\nEnamel blunting at CEJ.\nDiabetic.\nHigh Sugar Frequency reported.\n40% image restoration rate',
              '',
              '87%'
            ],
          ],
        ),
        _imageTableRow(aLabelled, aAnnoted),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FixedColumnWidth(200),
          children: [
            pw.TableRow(
              verticalAlignment: pw.TableCellVerticalAlignment.middle,
              children: [
                pw.Center(
                  child: pw.Text('LL4'),
                ),
                pw.Center(
                  child: pw.Text('Proximal'),
                ),
                pw.Center(
                  child: pw.Text('Dentine'),
                ),
                pw.Center(
                  child: pw.Text(
                      'Open contact point.\nMirror caries on adjacent tooth.\nDiabetic.\nHigh Sugar Frequency reported.\n40% image restoration rate.'),
                ),
                pw.Center(
                  child: pw.Text(
                      'Enamel Knife edge shape intact.\nCheck additional views if available!.'),
                ),
                pw.Center(
                  child: pw.Text('7%'),
                ),
              ],
            ),
          ],
        ),
        _imageTableRow(aLabelled, aAnnoted),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FixedColumnWidth(200),
          children: [
            pw.TableRow(
              verticalAlignment: pw.TableCellVerticalAlignment.middle,
              children: [
                pw.Center(
                  child: pw.Text('LL7'),
                ),
                pw.Center(
                  child: pw.Text('Proximal'),
                ),
                pw.Center(
                  child: pw.Text('Dentine'),
                ),
                pw.Center(
                  child: pw.Text(
                      'Irregular shaped radiolucency.\nEnamel blunting at CEJ.\nDiabetic.\nHigh Sugar Frequency reported.\nTilted tooth.\nPotential food trap gap.'),
                ),
                pw.Center(
                  child: pw.Text(''),
                ),
                pw.Center(
                  child: pw.Text('96%'),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  doc.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Marginal Discrepancy',
            style: pw.Theme.of(context).header0.copyWith(
                  decoration: pw.TextDecoration.underline,
                ),
          ),
          pw.Text('Caries risk:'),
          pw.Text(
              '40% restored rate on image (Restored teeth: Unrestored teeth)'),
          pw.Text(
              '30% caries identified on image (Carious teeth: Non-carious teeth)'),
          pw.SizedBox(height: 5.0 * PdfPageFormat.mm),
          pw.Table.fromTextArray(
            data: [
              [
                'Tooth Number',
                'Position on Tooth',
                'Indicators',
                'Uncertainties',
                'Confidence %',
                'Suggestion'
              ],
              [
                'UL7',
                'Distal',
                'Break in outline form from restoration to tooth structure.',
                'Check additional views if available! Visual assessment.',
                '13%',
                'Further investigation'
              ]
            ],
          ),
          pw.SizedBox(height: 10.0 * PdfPageFormat.mm),
          pw.Text(
            'Calculus',
            style: pw.Theme.of(context).header0.copyWith(
                  decoration: pw.TextDecoration.underline,
                ),
          ),
          pw.Table.fromTextArray(
            defaultColumnWidth: const pw.FixedColumnWidth(200),
            context: context,
            cellAlignment: pw.Alignment.center,
            data: const <List<String>>[
              <String>[
                'Tooth Number',
                'Position on Tooth',
                'Indicators',
                'Uncertainties',
                'Confidence %',
              ],
              <String>[
                'LL4',
                'Distal',
                'Bulbous radiopacity.',
                'Broad based.\nSmooth appearance.\nCheck additional views if available!.\nTactile assessment advised.',
                '33%'
              ],
            ],
          ),
          pw.Table(
            border: pw.TableBorder.all(),
            defaultColumnWidth: const pw.FixedColumnWidth(200),
            children: [
              pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Center(
                    child: pw.Text('LL5'),
                  ),
                  pw.Center(
                    child: pw.Text('Distal'),
                  ),
                  pw.Center(
                    child: pw.Text('Bulbous radiopacity.'),
                  ),
                  pw.Center(
                    child: pw.Text(
                        'Smooth appearance.\nCheck additional views if available!\nTactile assessment advised.'),
                  ),
                  pw.Center(
                    child: pw.Text('37%'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );

  doc.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Bone-loss Report',
            style: pw.Theme.of(context).header0.copyWith(
                  decoration: pw.TextDecoration.underline,
                ),
          ),
          pw.SizedBox(height: 5.0 * PdfPageFormat.mm),
          pw.Text('Diagnosis:'),
          pw.Text('Generalized Mild-early moderate horizontal bone-loss'),
          pw.Text('Angular bone loss associated with UL4'),
          pw.SizedBox(height: 10.0 * PdfPageFormat.mm),
          pw.Text('Patient Risk Factors:'),
          pw.Text('SH: Smoker 10/day'),
          pw.Text('MH: Diabetes'),
          pw.Text('OH regime: No interdental cleaning'),
          pw.SizedBox(height: 10.0 * PdfPageFormat.mm),
          pw.Table.fromTextArray(
            defaultColumnWidth: const pw.FixedColumnWidth(200),
            context: context,
            cellAlignment: pw.Alignment.center,
            data: const <List<String>>[
              <String>[
                'Number of Teeth identified on Xray',
                'CEJ reference points identified',
                'Current bone level tracing confidence %',
                'Impediments to diagnosis identified',
                'Confidence % in diagnosis',
              ],
              <String>['10', '13', '99%', 'Overlapping teeth on image.', '96%'],
            ],
          ),
          _imageTableRow(aBoneloss, aAnatomy),
        ],
      ),
    ),
  );

  doc.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Angular bone-loss',
            style: pw.Theme.of(context).header0.copyWith(
                  decoration: pw.TextDecoration.underline,
                ),
          ),
          pw.SizedBox(height: 5.0 * PdfPageFormat.mm),
          pw.Table.fromTextArray(
            defaultColumnWidth: const pw.FixedColumnWidth(200),
            context: context,
            cellAlignment: pw.Alignment.center,
            data: const <List<String>>[
              <String>[
                'Tooth Number',
                'Position of Angular bone-loss',
                'Furcal bone-loss',
                'Indicators',
                'Uncertainties',
                'Calculus detected',
                'Confidence %',
              ],
              <String>[
                'UL4',
                'Distal',
                'Nil',
                'Oblique/angular orientation of loss identified in relation to long axis of tooth.',
                'Horizontal bitewing view not recommended for diagnosis.\nCheck additional views if available!',
                'y',
                '4%',
              ],
            ],
          )
        ],
      ),
    ),
  );

  return await doc.save();
}
