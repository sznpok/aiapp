import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  //String apiKey = "AIzaSyA4v1UgPMacCmrRQb658NbY6B5DPe1-msE";

  func() async {
    String apiKey = "AIzaSyA4v1UgPMacCmrRQb658NbY6B5DPe1-msE";
    // Platform.environment["AIzaSyA4v1UgPMacCmrRQb658NbY6B5DPe1-msE"];
    if (apiKey.isEmpty) {
      log('No \$API_KEY environment variable');
    }
    // For text-only input, use the gemini-pro model
    final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: apiKey,
        generationConfig: GenerationConfig(maxOutputTokens: 100));
    // Initialize the chat
    final chat = model.startChat(
      history: [
        Content.text('Hello, I have 2 dogs in my house.'),
        Content.model(
            [TextPart('Great to meet you. What would you like to know?')])
      ],
    );
    var content = Content.text('How many paws are in my house?');
    var response = await chat.sendMessage(content);
    log(response.text.toString());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          func();
        },
      ),
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
