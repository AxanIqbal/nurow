import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/subtraction.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> subMasterPDF(
    PdfPageFormat format, Patient patient, SubtractionXray subXray) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);
  final heading = pw.MemoryImage(
    (await rootBundle.load('assets/pdf_heading.png')).buffer.asUint8List(),
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
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Image(heading),
          pw.SizedBox(
            height: 20.0 * PdfPageFormat.mm,
          ),
          pw.Center(
            child: pw.Text(
              "Subtractive analysis",
              style: pw.Theme.of(context).header0.copyWith(
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),
            ),
          ),
          pw.SizedBox(
            height: 20.0 * PdfPageFormat.mm,
          ),
          pw.Text(
            "Date: ${DateFormat("dd MMM yyyy").format(DateTime.now()).toString()}",
          ),
          pw.SizedBox(
            height: 20.0 * PdfPageFormat.mm,
          ),
          pw.Text(
            'Patient Summary',
            style: pw.Theme.of(context).header0,
          ),
          pw.SizedBox(
            height: 20.0 * PdfPageFormat.mm,
          ),
          pw.Table(
            columnWidths: const {
              0: pw.FlexColumnWidth(2),
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
                      DateFormat("dd-MMM-yyyy").format(patient.dob).toString()),
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
                  pw.Text('Number:'),
                  pw.Text(patient.number),
                ],
              ),
            ],
          ),
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
        pw.Center(
          child: pw.Text(
            'Radiograph 1',
            style: pw.Theme.of(context).header0.copyWith(
                  fontWeight: pw.FontWeight.bold,
                  decoration: pw.TextDecoration.underline,
                ),
          ),
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.SizedBox(
          width: 80.0 * PdfPageFormat.mm,
          child: pw.Table(
            children: [
              pw.TableRow(
                children: [
                  pw.Text("Type:"),
                  pw.Text(subXray.radiographType),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Text("Date of radiograph:"),
                  pw.Text(DateFormat("dd/MM/yyyy")
                      .format(subXray.xrays[0].timeStamp)
                      .toString()),
                ],
              ),
            ],
          ),
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Text(
          'Caries',
          style: pw.Theme.of(context).header0.copyWith(
                decoration: pw.TextDecoration.underline,
              ),
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
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
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Text(
          'Bone-loss Report',
          style: pw.Theme.of(context).header0.copyWith(
                decoration: pw.TextDecoration.underline,
              ),
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
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
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Center(
          child: pw.Text(
            'Radiograph 2',
            style: pw.Theme.of(context).header0.copyWith(
                  fontWeight: pw.FontWeight.bold,
                  decoration: pw.TextDecoration.underline,
                ),
          ),
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.SizedBox(
          width: 80.0 * PdfPageFormat.mm,
          child: pw.Table(
            children: [
              pw.TableRow(
                children: [
                  pw.Text("Type:"),
                  pw.Text(subXray.xrays[1].radiographType),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Text("Date of radiograph:"),
                  pw.Text(DateFormat("dd/MM/yyyy")
                      .format(subXray.xrays[1].timeStamp)
                      .toString()),
                ],
              ),
            ],
          ),
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Text(
          'Caries',
          style: pw.Theme.of(context).header0.copyWith(
                decoration: pw.TextDecoration.underline,
              ),
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
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
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Text(
          'Bone-loss Report',
          style: pw.Theme.of(context).header0.copyWith(
                decoration: pw.TextDecoration.underline,
              ),
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
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
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Center(
          child: pw.Text(
            'Comparative analysis',
            style: pw.Theme.of(context).header0.copyWith(
                  fontWeight: pw.FontWeight.bold,
                  decoration: pw.TextDecoration.underline,
                ),
          ),
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Text(
          'Time lapse between images: ${subXray.xrays[1].timeStamp.difference(subXray.xrays[0].timeStamp).inHours / 24} days',
        ),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Text('Comparative image discrepancy: 18%'),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Text('Caries LL6: +11%'),
        pw.Text('Caries LL7: +4%'),
        pw.SizedBox(
          height: 10.0 * PdfPageFormat.mm,
        ),
        pw.Text('Bone-level change average: 0.4%')
      ],
    ),
  );

  return await doc.save();
}
