import 'package:story_blender/src/API/Comunication/action.dart';
import 'package:story_blender/src/API/Comunication/request.dart';
import 'package:story_blender/src/API/Comunication/response.dart';
import 'package:story_blender/src/API/Wizards/wizard.dart';

class InterfaceWizard extends Wizard {
  InterfaceWizard(String startupBio) : super(startupBio);


  @override
  Response handleRequest(Request request) {
    // this is where the magic happens

    return Response();
    // Implementation here
  }

  @override
  void process() {
    // Implementation here
  }

  @override
  void sendResponse(Response response) {
    // Implementation here
  }

  Action parseUserResponse(String response) {
    // Implementation here
    return Action();
  }

  Response determineNextStep(Action action) {
    // Implementation here
    return Response();
  }
}
