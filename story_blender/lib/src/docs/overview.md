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
```