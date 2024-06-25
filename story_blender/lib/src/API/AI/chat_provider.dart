import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;
import 'package:story_blender/src/API/Comunication/request.dart';
import 'package:story_blender/src/API/Comunication/response.dart';

class ChatProvider extends ChangeNotifier {
  final List<String> _messages = [];
  static const apiKey = ''; // Set the API key in your environment variables

  List<String> get messages => _messages;

  /// Sends a message and adds the response to the message list.
  Future<void> sendMessage(String message) async {
    _messages.add("You: $message");
    notifyListeners();
    final responseText = await _generateResponse(message);
    _messages.add(responseText.text);
    notifyListeners();
  }

  /// Processes a request using the ChatProvider instance.
  /// 
  /// @param request The request to be processed.
  /// @returns The response from processing the request.
  @override
  Future<Response> processRequest(Request request) async {
    final prompt = jsonEncode(request.toJson()); // Assuming Request has a toJson() method
    return  _generateResponse(prompt);
  }

  /// Sends a query to the AI model and returns the result.
  /// 
  /// @param query The query to be sent.
  /// @returns The response from the AI model.
  Future<Response> ask(Request request) async {
    return await _generateResponse(request.query);
  }

  /// Purges the current session.
  void purgeSession() {
    _messages.clear();
    notifyListeners();
  }

  /// Restarts the session with a new startup bio.
  /// 
  /// @param startupBio The startup bio for the new session.
  void restartSession(String startupBio) {
    purgeSession();
    _messages.add("Startup Bio: $startupBio");
    notifyListeners();
  }

  /// Generates a response from the AI model.
  /// 
  /// @param input The input prompt to be sent to the model.
  /// @returns The response from the model as a string.
  Future<Response> _generateResponse(String input) async {
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    final content = [
      Content.multi([
        TextPart(input),
      ])
    ];

    try {
      final response = await model.generateContent(content);
      
      return Response(text: response.text ?? 'No response');
    } catch (e) {
      return Response(text: 'An error occurred: $e');
    }
  }
}
