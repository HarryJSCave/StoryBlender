import 'package:story_blender/src/API/AI/chat_provider.dart';
import 'package:story_blender/src/API/Comunication/request.dart';
import 'package:story_blender/src/API/Comunication/response.dart';

class AISession {
  static ChatProvider createSession() {
    return ChatProvider();
  }

  static Future<ChatProvider> createSessionWithRetry({int maxRetries = 3, Duration retryDelay = const Duration(seconds: 1)}) async {
    int retries = 0;
    while (retries < maxRetries) {
      try {
        return createSession();
      } catch (e) {
        print('Error creating session: $e');
        retries++;
        await Future.delayed(retryDelay);
      }
    }
    throw Exception('Failed to create session after $maxRetries retries');
  }

}
