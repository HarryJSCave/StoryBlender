import 'package:story_blender/src/API/AI/chat_provider.dart';
import 'package:story_blender/src/API/Comunication/request.dart';
import 'package:story_blender/src/API/Comunication/response.dart';

/**
 * AISession class
 * 
 * This class manages the creation and handling of AI sessions using the ChatProvider.
 */
class AISession {
  /// The ChatProvider instance used for the AI session.
  late ChatProvider _chatProvider;

  /**
   * Creates an instance of AISession.
   * 
   * Initializes the ChatProvider instance.
   */
  AISession() {
    _chatProvider = ChatProvider();
  }

  /**
   * Creates a new ChatProvider session.
   * 
   * @returns A new instance of ChatProvider.
   */
  static ChatProvider _createSession() {
    return ChatProvider();
  }

  /**
 * purge session method
 * 
 */
  void purgeSession() {
    _chatProvider.purgeSession();
  
  }

  /**
   * restart session method
   *
   */

  void restartSession(String startupBio) {
    _chatProvider.restartSession(startupBio);
  }

  Future<Response> ask(Request query) {
    return _chatProvider.ask(query);
  }
  

  /**
   * Creates a new ChatProvider session with retry logic.
   * 
   * Tries to create a session up to [maxRetries] times, waiting [retryDelay] between attempts.
   * 
   * @param maxRetries The maximum number of retry attempts (default is 3).
   * @param retryDelay The delay between retry attempts (default is 1 second).
   * @returns A new instance of ChatProvider.
   * @throws Exception if the session could not be created after the maximum number of retries.
   */
  static Future<ChatProvider> createSessionWithRetry({int maxRetries = 3, Duration retryDelay = const Duration(seconds: 1)}) async {
    int retries = 0;
    while (retries < maxRetries) {
      try {
        return _createSession();
      } catch (e) {
        print('Error creating session: $e');
        retries++;
        await Future.delayed(retryDelay);
      }
    }
    throw Exception('Failed to create session after $maxRetries retries');
  }

  /**
   * Processes a request using the ChatProvider instance.
   * 
   * @param request The request to be processed.
   * @returns The response from processing the request.
   */
  Future<Response> processRequest(Request request) async {
    // Example implementation, replace with actual logic to process the request
    return _chatProvider.processRequest(request);
  }
}
