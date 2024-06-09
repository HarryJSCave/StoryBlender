import 'package:story_blender/src/API/Comunication/response.dart';
import 'package:story_blender/src/API/Wizards/storypoints/world_wizard.dart';
import 'package:story_blender/src/API/Wizards/wizard.dart';

class WizardController {
  Wizard createWizard(WizardType type) {
    // Implementation here
    return WorldWizard('');
  }

  Wizard getWizard(WizardType type) {
    // Implementation here
    return WorldWizard('');
  }

  void deleteWizard(WizardType type) {
    // Implementation here
    
  }

  Response handleResponse(Response response) {
    // Implementation here
    return Response();
  }
}
