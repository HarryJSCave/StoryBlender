import 'package:story_blender/src/API/Comunication/request.dart';
import 'package:story_blender/src/API/Comunication/response.dart';

abstract class Wizard {
  String startupBio;

  Wizard(this.startupBio);

  Response handleRequest(Request request);
  void process();
  void sendResponse(Response response);
}



enum WizardType {
  Interface,
  World,
  Item,
}
