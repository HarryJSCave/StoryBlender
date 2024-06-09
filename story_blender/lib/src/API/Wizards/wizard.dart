import 'package:story_blender/src/API/AI/ai_session.dart';
import 'package:story_blender/src/API/Comunication/request.dart';
import 'package:story_blender/src/API/Comunication/response.dart';

/**
 * Abstract Wizard class
 * 
 * Represents a base class for all specific wizards. Each wizard has a startup bio and an AI session.
 */
abstract class Wizard {
  String startupBio;
  AISession aiSession;

  Wizard(this.startupBio) : aiSession = AISession();

  /**
   * Creates an AI session with the startup bio.
   */
  void createAiSession() {
    aiSession.restartSession(startupBio);
  }

  /**
   * Handles a request and returns a response.
   * 
   * @param request The request to be handled.
   * @returns The response to the request.
   */
  Response handleRequest(Request request);

  /**
   * Processes the current state or action.
   */
  void process();

  /**
   * Sends a response.
   * 
   * @param response The response to be sent.
   */
  void sendResponse(Response response);
}

/**
 * Enumeration for different types of wizards.
 */
enum WizardType {
  Interface,
  World,
  Item,
}