import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:aiapp/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AddChemicalScreen extends StatefulWidget {
  const AddChemicalScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddChemicalState();
  }
}

class AddChemicalState extends State<AddChemicalScreen> {
  final TextEditingController controller = TextEditingController();

  GenerateContentResponse? responseResponse;
  GenerateContentResponse? benefitsResponse;
  GenerateContentResponse? propertiesResponse;
  GenerateContentResponse? localNameResponse;
  GenerateContentResponse? scientificNameResponse;
  GenerateContentResponse? medicalUsesResponse;
  GenerateContentResponse? chemicalFoundResponse;

  func(String title) async {
    String apiKey = "AIzaSyA4v1UgPMacCmrRQb658NbY6B5DPe1-msE";
    // Platform.environment["AIzaSyA4v1UgPMacCmrRQb658NbY6B5DPe1-msE"];
    if (apiKey.isEmpty) {
      log('No \$API_KEY environment variable');
    }
    // For text-only input, use the gemini-pro model
    final model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );

    //benefits
    var benefits = "Give me the benefits for this compound$title";
    final benefitsContent = [Content.text(benefits)];
    benefitsResponse = await model.generateContent(benefitsContent);
    log(benefitsResponse!.text.toString());

    //medical uses
    var medical = "Give me the medical uses for this compound$title";
    final medicalContent = [Content.text(medical)];
    medicalUsesResponse = await model.generateContent(medicalContent);
    log(medicalUsesResponse!.text.toString());

    //local name
    var local = "Give me local name for this compound$title";
    final localContent = [Content.text(local)];
    localNameResponse = await model.generateContent(localContent);
    log(localNameResponse!.text.toString());

    //chemical found
    var chemicalFound = "Give me the chemical found  this compound$title";
    final chemicalFoundContent = [Content.text(chemicalFound)];
    chemicalFoundResponse = await model.generateContent(chemicalFoundContent);
    log(chemicalFoundResponse!.text.toString());

    //sci name
    var sci = "Give me the scientific name for this compound$title";
    final sciContent = [Content.text(sci)];
    scientificNameResponse = await model.generateContent(sciContent);
    log(scientificNameResponse!.text.toString());

    //properites
    var pro = "Give me the properties for this compound$title";
    final proContent = [Content.text(pro)];
    propertiesResponse = await model.generateContent(proContent);
    log(propertiesResponse!.text.toString());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Chemical Formula'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Chemical Formula'),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  label: const Text("Enter Chemical Formula"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () {
                  func(controller.text);

                  /*Timer(
                    const Duration(seconds: 3),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          benefits: benefitsResponse?.text != null
                              ? benefitsResponse!.text
                              : "",
                          chemicalFormula: controller.text,
                          chemicalFound: chemicalFoundResponse?.text != null
                              ? chemicalFoundResponse!.text
                              : "",
                          localName: localNameResponse?.text != null
                              ? localNameResponse!.text
                              : "",
                          medicalUses: medicalUsesResponse?.text != null
                              ? medicalUsesResponse!.text
                              : "",
                          properties: propertiesResponse?.text != null
                              ? propertiesResponse!.text
                              : "",
                          scientificName: scientificNameResponse?.text != null
                              ? scientificNameResponse!.text
                              : "",
                        ),
                      ),
                    ),
                  );*/

                  /*await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        benefits: "",
                        chemicalFormula: response!.text,
                        chemicalFound: "",
                        localName: "",
                        medicalUses: "",
                        properties: "",
                        scientificName: "",
                      ),
                    ),
                  );*/
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text("View Details"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
