

# Classes


## Wizard

The `Wizard` class serves as the base class for all specific wizards. It defines the common interface for handling requests and processing actions.

### Methods

- `handleRequest(request: Request): Response`: Handles incoming requests and returns a response.
- `process(): void`: Processes the current state or action.

## InterfaceWizard

The `InterfaceWizard` class is a specific type of wizard that handles user responses. It inherits from the `Wizard` class.

### Methods

- `handleRequest(request: Request): Response`: Handles user responses and returns a corresponding action.
- `process(): void`: Processes the determined actions.
- `parseUserResponse(response: String): Action`: Parses the user response and determines the appropriate action.
- `determineNextStep(action: Action): Response`: Determines the next step based on the parsed action and returns a response.

