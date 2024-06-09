# Request and Response

The `Request` and `Response` objects are used to facilitate interactions between the user and the wizards.

## Request - Send to Wizard

The `Request` object encapsulates the query and the context information. This can include detailed JSON structures with objects that store relative information, such as the context of the request, which characters it is valid for, etc.

### Structure

- `query`: A string representing the user's query (e.g., "Can you create me a sword?").
- `context`: A JSON object that stores all relevant information about the request, including which characters this request is valid for.

### Example

{
  "query": "Can you create me a sword?",
  "context": {
    "storypoints": [StoryPoint1, StoryPoint2, ...],
  }
}

## Response - Sent by Wizard

The `Response` object encapsulates the result of handling a request.

### Structure

- `message`: A string containing the response message.
- `action`: An optional action that the wizard should take next.
- `additionalData`: Any additional data relevant to the response.

### Example

```json
{
  "message": "The sword has been created successfully.",
  "storyPointCreated": StoryPoint,
  "itemsCreated": [Item1, Item2, ...]
}
  