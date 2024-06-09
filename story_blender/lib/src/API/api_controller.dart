import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;

class ChatProvider extends ChangeNotifier {
  final List<String> _messages = [];

  List<String> get messages => _messages;

  void sendMessage(String message) async {
    _messages.add("You: $message");
    notifyListeners();

  const apiKey = 'AIzaSyAn4I9W_0gQQs4bHsKtv2sKFDhDpE_wdGo'; // Recommended: Set the API key in your environment variables and access it e.g., final apiKey = Platform.environment['API_KEY'];
  final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
  final prompt = message;
  final content = [
    Content.multi([
      TextPart(prompt),
    ])
  ];

  try {
       final  response = await model.generateContent(content);

    _messages.add(response.candidates[0].content.parts[0].toJson().toString());
  } catch (e) {
    _messages.add('Error: $e');
  }   


    notifyListeners();
  }
}


class AIController {}