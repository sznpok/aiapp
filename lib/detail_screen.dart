import 'package:flutter/material.dart';

import 'card_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    this.chemicalFormula,
    this.localName,
    this.scientificName,
    this.chemicalFound,
    this.properties,
    this.benefits,
    this.medicalUses,
  });

  final String? chemicalFormula;
  final String? localName;
  final String? scientificName;
  final String? chemicalFound;
  final String? properties;
  final String? benefits;
  final String? medicalUses;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemical Compound Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(
              title: "Chemical Formula",
              des: chemicalFormula,
            ),
            CardWidget(
              title: "Local Name",
              des: localName,
            ),
            CardWidget(
              title: "Scientific Name",
              des: scientificName,
            ),
            CardWidget(
              title: "Chemical Found",
              des: chemicalFound,
            ),
            CardWidget(
              title: "Properties",
              des: properties,
            ),
            CardWidget(
              title: "Benefits",
              des: benefits,
            ),
            CardWidget(
              title: "Medical Uses",
              des: medicalUses,
            ),
          ],
        ),
      ),
    );
  }
}
