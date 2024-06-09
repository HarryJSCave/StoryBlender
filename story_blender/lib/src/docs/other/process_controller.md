
markdown
Copy code
# Class Structure Documentation

## Overview

This document describes the class structure for StoryBlender, which utilizes various AI sessions that I will refer to as wizards because that's what they are. Also, I think it's more fun to conceptualize them this way. Each wizard controls a different part of the program. The wizards are managed by a `WizardController`.

## Class Diagram

```mermaid
classDiagram
    direction LR
    class WizardController {
        +createWizard(type: WizardType): Wizard
        +getWizard(type: WizardType): Wizard
        +deleteWizard(type: WizardType): void
        +Response handleResponse(Response response)
    }

    class ProcessController {
        +void monitorAICalls()
        +void enforceDecisionMaking()
    }
    
    class Wizard {
        +Request handleRequest(Request request)
        +void process()
        +void sendResponse(Response response)
        +String startupBio
        <<abstract>>
    }
    
    class InterfaceWizard {
        +Request handleRequest(Request request)
        +void process()
        +void sendResponse(Response response)
        +parseUserResponse(response: String): Action
        +determineNextStep(action: Action): Response
    }
    
    class WorldWizard {
        +Request handleRequest(Request request)
        +void process()
        +void sendResponse(Response response)
        +handleWorldInteraction(item: Item): Response
    }

    class ItemWizard {
        +Request handleRequest(Request request)
        +void process()
        +void sendResponse(Response response)
        +createItem(request: Request): Item
    }

    class AISession {
        +processRequest(request: Request): Response
    }

    class Request {
        -query: String
        -context: Context
    }

    class Response {
        -message: String
        -action: String
        -additionalData: Map<String, Object>
    }

    class StoryPoint {
        -description: String
        -conditions: List<String>
    }

    class Item {
        -name: String
        -type: String
        -attributes: Map<String, Object>
    }

    class Context {
        -storyPoints: List<StoryPoint>
    }

    WizardController --> Wizard
    Wizard <|-- InterfaceWizard
    Wizard <|-- WorldWizard
    Wizard <|-- ItemWizard
    Wizard --> AISession
    Request --> Context
    Response --> StoryPoint
    Response --> Item
Classes
WizardController
The WizardController class is responsible for managing the wizards. It provides methods to create, retrieve, and delete wizards. It also determines the most appropriate wizard to handle a given response.

Methods
createWizard(type: WizardType): Wizard: Creates a new wizard of the specified type.
getWizard(type: WizardType): Wizard: Retrieves the wizard of the specified type.
deleteWizard(type: WizardType): void: Deletes the wizard of the specified type.
handleResponse(response: Response): Response: Takes a response and calculates the most appropriate wizard to ask for more information.
ProcessController
The ProcessController class is responsible for handling the larger picture and ensuring that the system does not get stuck in AI overcurrent (loops of asking itself questions). It monitors the calls and responses between the AIs and forces a decision once a defined ticker amount of calls is reached.

Methods
monitorAICalls(): Monitors the calls and responses between the AIs.
enforceDecisionMaking(): Forces the collective network of AIs to make a decision after a defined number of calls.
Wizard
The Wizard class serves as the abstract base class for all specific wizards. It defines the common interface for handling requests and processing actions. Each wizard also interacts with an AISession.

Properties
startupBio: A string containing the startup bio fed to the wizard every time it is created.
Methods
handleRequest(request: Request): Response: Handles incoming requests and returns a response.
process(): void: Processes the current state or action.
sendResponse(response: Response): void: Sends a response.