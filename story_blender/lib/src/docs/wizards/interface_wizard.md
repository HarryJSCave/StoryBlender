InterfaceWizard
The InterfaceWizard class is a specific type of wizard that handles user responses. It inherits from the Wizard class.

Methods
handleRequest(request: Request): Response: Handles user responses and returns a corresponding action.
process(): void: Processes the determined actions.
sendResponse(response: Response): void: Sends a response.
parseUserResponse(response: String): Action: Parses the user response and determines the appropriate action.
determineNextStep(action: Action): Response: Determines the next step based on the parsed action and returns a response.