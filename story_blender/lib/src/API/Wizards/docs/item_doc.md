
# Item

The `Item` class represents an abstract idea of anything in a story, like a character, a place, a location, or a tool like a sword.

## Attributes

- `name`: A string representing the name of the item.
- `type`: A string representing the type of item.
- `attributes`: A map of attributes related to the item.


# Context

The `Context` class stores all relevant information about the request, including the story points related to the request.

## Attributes

- `storyPoints`: A list of `StoryPoint` objects.

### Example

{
  "storyPoints": ["StoryPoint1", "StoryPoint2"]
}

