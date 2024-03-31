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
    Platform.environment["AIzaSyA4v1UgPMacCmrRQb658NbY6B5DPe1-msE"];
    if (apiKey.isEmpty) {
      log('No \$API_KEY environment variable');
    }
    // For text-only input, use the gemini-pro model
    final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: apiKey,
        generationConfig: GenerationConfig(maxOutputTokens: 100));
    final chat = model.startChat(
        /*history: [
        Content.text('Hello, I have 2 dogs in my house.'),
        Content.model(
            [TextPart('Great to meet you. What would you like to know?')])
      ],*/
        );
    var content = Content.text(title);
    responseResponse = await chat.sendMessage(content);
    var benefitsContent =
        Content.text("Give me the benefits for this compound$title");
    benefitsResponse = await chat.sendMessage(benefitsContent);
    var medicalContent =
        Content.text("Give me the medical uses for this compound$title");
    medicalUsesResponse = await chat.sendMessage(medicalContent);
    var localContent =
        Content.text("Give me local name for this compound$title");
    localNameResponse = await chat.sendMessage(localContent);
    var chemicalFoundContent =
        Content.text("Give me the chemical found  this compound$title");
    chemicalFoundResponse = await chat.sendMessage(chemicalFoundContent);
    var sciContent =
        Content.text("Give me the scientific name for this compound$title");
    scientificNameResponse = await chat.sendMessage(sciContent);
    var proContent =
        Content.text("Give me the properties for this compound$title");
    propertiesResponse = await chat.sendMessage(proContent);
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
                onPressed: () async {
                  func(controller.text);
                  Timer(
                    const Duration(seconds: 3),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          benefits: benefitsResponse!.text ?? "",
                          chemicalFormula: controller.text ?? "",
                          chemicalFound: chemicalFoundResponse!.text ?? "",
                          localName: localNameResponse!.text ?? "",
                          medicalUses: medicalUsesResponse!.text ?? "",
                          properties: propertiesResponse!.text ?? "",
                          scientificName: scientificNameResponse!.text ?? "",
                        ),
                      ),
                    ),
                  );
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
