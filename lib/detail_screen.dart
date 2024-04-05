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
    // TODO: implement buildif (localName != null)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemical Compound Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (chemicalFormula != null)
              CardWidget(
                title: "Chemical Formula",
                des: chemicalFormula!,
              ),
            if (localName != null)
              CardWidget(
                title: "Local Name",
                des: localName!,
              ),
            // CardWidget(
            //   title: "Local Name",
            //   des: localName!,
            // ),
            if (scientificName != null)
              CardWidget(
                title: "Scientific Name",
                des: scientificName!,
              ),
            if (chemicalFound != null)
              CardWidget(
                title: "Chemical Found",
                des: chemicalFound!,
              ),
            if (properties != null)
              CardWidget(
                title: "Properties",
                des: properties!,
              ),
            if (benefits != null)
              CardWidget(
                title: "Benefits",
                des: benefits!,
              ),
            if (medicalUses != null)
              CardWidget(
                title: "Medical Uses",
                des: medicalUses!,
              ),
          ],
        ),
      ),
    );
  }
}
