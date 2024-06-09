

import 'package:story_blender/src/API/Comunication/request.dart';
import 'package:story_blender/src/API/Comunication/response.dart';
import 'package:story_blender/src/API/Wizards/wizard.dart';
import 'package:story_blender/src/Classes/item.dart';

class WorldWizard extends Wizard {
  WorldWizard(String startupBio) : super(startupBio);

  @override
  Response handleRequest(Request request) {
    // Implementation here
    return Response();
  }

  @override
  void process() {
    // Implementation here
  }

  @override
  void sendResponse(Response response) {
    // Implementation here
  }

  Response handleWorldInteraction(Item item) {
    // Implementation here
    return Response();
  }
}
