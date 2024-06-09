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
    }
    
    class Wizard {
        +handleRequest(request: Request): Response
        +process(): void
    }
    
    class InterfaceWizard {
        +handleRequest(request: Request): Response
        +process(): void
        +parseUserResponse(response: String): Action
        +determineNextStep(action: Action): Response
    }
    
    class WorldWizard {
        +handleRequest(request: Request): Response
        +process(): void
        +handleWorldInteraction(item: Item): Response
    }

    class ItemWizard {
        +handleRequest(request: Request): Response
        +process(): void
        +createItem(request: Request): Item
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
    Request --> Context
    Response --> StoryPoint
    Response --> Item

````

# Classes

## WizardController

The `WizardController` class is responsible for managing the wizards. It provides methods to create, retrieve, and delete wizards.

### Methods

- `createWizard(type: WizardType): Wizard`: Creates a new wizard of the specified type.
- `getWizard(type: WizardType): Wizard`: Retrieves the wizard of the specified type.
- `deleteWizard(type: WizardType): void`: Deletes the wizard of the specified type.

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

