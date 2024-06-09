
import 'package:story_blender/src/API/Comunication/request.dart';
import 'package:story_blender/src/API/Comunication/response.dart';
import 'package:story_blender/src/API/Wizards/wizard.dart';
import 'package:story_blender/src/Classes/item.dart';

class ItemWizard extends Wizard {
  ItemWizard(String startupBio) : super(startupBio);
  

  @override
  Response handleRequest(Request request) {
    // Implementation here
    final text_response = this.aiSession.ask(request.query);
    return Response(text: text_response);
  }

  @override
  void process() {
    // Implementation here
  }

  @override
  void sendResponse(Response response) {
    // Implementation here
  }



  Item createItem(Request request) {
    /**
     *   /// The name of the item.
  String name;

  /// The type of the item (e.g., tool, character, place).
  String type;

  /// A map of attributes related to the item.
  Map<String, dynamic> attributes;
     */
    const tempName = "temp_name";
    const tempType = "temp_type";
    const tempAttributes = {"temp_key": "temp_value"};
    
    // Implementation here
    return Item(name: tempName, type: tempType, attributes: tempAttributes);
  }
}