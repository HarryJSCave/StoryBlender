/**
 * Item class
 * 
 * Represents an item in the story with a name, type, and various attributes.
 */
class Item {
  /// The name of the item.
  String name;

  /// The type of the item (e.g., tool, character, place).
  String type;

  /// A map of attributes related to the item.
  Map<String, dynamic> attributes;

  /**
   * Constructs an [Item] with the given [name], [type], and [attributes].
   * 
   * @param name The name of the item.
   * @param type The type of the item.
   * @param attributes A map of attributes related to the item.
   */
  Item(String temp_name, String temp_type, Map<String, String> temp_attributes, {
    required this.name,
    required this.type,
    required this.attributes,
  });
}
