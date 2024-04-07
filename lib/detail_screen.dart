import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;
import 'card_widget.dart';
import 'chemical_model.dart';
import 'package:open_file/open_file.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.screenData});

  final ChemicalModel screenData;
  final pdf = pw.Document();

  void _downloadPDF(BuildContext context) async {
    final ByteData data = await rootBundle.load('assets/Chemical_formula.pdf');
    final Uint8List bytes = data.buffer.asUint8List();
    final String base64String = base64Encode(bytes);

    final anchor = html.AnchorElement(
      href: 'data:application/pdf;base64,$base64String',
    )
      ..setAttribute('download', 'your_pdf_file.pdf')
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemical Details'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        label: Row(
          children: [
            Text(
              'Download Now',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.download,
              color: Colors.white,
            )
          ],
        ),
        onPressed: () async {
          log('before downloading');
          _downloadPDF(context);
          log('after downloading downloading');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(
              title: "Scientific name",
              des: screenData.scientificName,
            ),
            CardWidget(
              title: "Local Name",
              des: screenData.commanName,
            ),
            CardWidget(
              title: "Benifits",
              des: screenData.benifits,
            ),
            CardWidget(
              title: "Medical Uses",
              des: screenData.mediacalUses,
            ),
            CardWidget(
              title: "Industrial Applications",
              des: screenData.industrialApplication,
            ),
            CardWidget(
              title: "Materials used",
              des: screenData.metarials,
            ),
          ],
        ),
      ),
    );
  }
}
