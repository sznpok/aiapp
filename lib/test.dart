// code for making an pdf and downloading   // actions: [
        //   IconButton(
        //     onPressed: () async {
        //       // pdf.addPage(
        //       //   pw.Page(
        //       //     pageFormat: PdfPageFormat.a4,
        //       //     build: (pw.Context context) {
        //       //       return pw.Column(
        //       //         crossAxisAlignment: pw.CrossAxisAlignment.start,
        //       //         children: [
        //       //           pw.Text(
        //       //             "Scientific name: ${screenData.scientificName}",
        //       //           ),
        //       //           pw.Text(
        //       //             "Local Name: ${screenData.commanName}",
        //       //           ),
        //       //           pw.Text(
        //       //             "Benifits: ${screenData.benifits}",
        //       //           ),
        //       //           pw.Text(
        //       //             "Medical Uses: ${screenData.mediacalUses}",
        //       //           ),
        //       //           pw.Text(
        //       //             "Industrial Applications: ${screenData.industrialApplication}",
        //       //           ),
        //       //           pw.Text(
        //       //             "Materials used: ${screenData.metarials}",
        //       //           ),
        //       //         ],
        //       //       );
        //       //     },
        //       //   ),
        //       // );

        //       // // Create a blob URL for the PDF
        //       // final blob = html.Blob([await pdf.save()]);
        //       // final url = html.Url.createObjectUrlFromBlob(blob);

        //       // // Create an anchor element to trigger the download
        //       // final anchor = html.AnchorElement(href: url)
        //       //   ..setAttribute(
        //       //     "download",
        //       //     "${DateTime.now().millisecondsSinceEpoch}.pdf",
        //       //   )
        //       //   ..click();

        //       // // Revoke the blob URL to free up resources
        //       // html.Url.revokeObjectUrl(url);
        //     },
        //     icon: Icon(Icons.download),
        //   )
        // ],