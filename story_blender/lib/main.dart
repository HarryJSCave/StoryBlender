import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';


void main() async {

  /// Add this line



  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(MyApp(settingsController: settingsController));
}

