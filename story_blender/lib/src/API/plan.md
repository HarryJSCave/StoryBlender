# Work Plan Flow Chart

## Phase 1: Create and Test a Single Wizard
```mermaid
graph LR
A[Phase 1: Create and Test a Single Wizard]
A1[Define the Wizard Class with a Bio] --> A1_1[Create a subclass of Wizard]
A1 --> A1_2[Implement constructor with bio and AISession]
A2[Implement a Simple Test] --> A2_1[Create an instance of TestWizard]
A2 --> A2_2[Call handleRequest and verify response]
A --> A1 --> A2
```
## Phase 2: Create and Test Multiple Wizards
```mermaid
graph LR
B[Phase 2: Test Creating Multiple Wizards]
B1[Create Multiple Wizards] --> B1_1[Extend test to create two instances with different bios]
B2[Verify Independent Responses] --> B2_1[Ensure each wizard handles requests and generates independent responses]
B --> B1 --> B2

```
## Phase 3: Implement ProcessController for Wizard Communication
```mermaid
graph LR
C[Phase 3: Implement ProcessController for Wizard Communication]
C1[Define ProcessController] --> C1_1[Implement ProcessController class]
C1 --> C1_2[Add methods to monitor AI calls and enforce decision-making]
C2[Test Wizard Communication] --> C2_1[Create two TestWizard instances]
C2 --> C2_2[Use ProcessController to manage interactions]
C --> C1 --> C2

```

## Phase 4: Implement and Test Story Points
```mermaid
graph LR
D[Phase 4: Implement and Test Story Points]
D1[Define StoryPoint Class] --> D1_1[Implement StoryPoint class with attributes]
D2[Integrate StoryPoint with Wizards] --> D2_1[Modify Wizard class to handle story points]
D3[Test Story Point Creation] --> D3_1[Create a StoryPoint and associate with a wizard]
D --> D1 --> D2 --> D3
```

## Phase 5: Save Story Points to the Database
```mermaid
graph LR
E[Phase 5: Save Story Points to the Database]
E1[Set Up Database Integration] --> E1_1[Choose and configure a database]
E1 --> E1_2[Implement data models for story points]
E2[Implement Save Functionality] --> E2_1[Write methods to save and retrieve story points]
E3[Test Database Integration] --> E3_1[Create a StoryPoint and save it to the database]
E3 --> E3_2[Verify it can be retrieved]
E --> E1 --> E2 --> E3
```
## phase 6: Dynamic Wizard Creation and Contextual Story Points
```mermaid
graph LR
F[Phase 6: Dynamic Wizard Creation and Contextual Story Points]
F1[Dynamic Wizard Creation Based on User Queries] --> F1_1[Implement method in WizardController]
F2[Feed Story Points to Wizards] --> F2_1[Fetch story points from database and initialize wizards]
F3[Test End-to-End Integration] --> F3_1[Simulate user query]
F3 --> F3_2[Dynamically create wizards]
F3 --> F3_3[Ensure wizards are fed the correct story points]
F --> F1 --> F2 --> F3
```

## Phase 7: Implement Item Creation and Interaction
```mermaid
graph LR
G[Phase 7: Implement Item Creation and Interaction]
G1[Define Item Class] --> G1_1[Implement Item class with attributes]
G2[Create ItemWizard] --> G2_1[Implement ItemWizard to create items]
G3[Handle Item Interactions] --> G3_1[Modify Wizards to interact with items]
G4[Test Item Creation and Interaction] --> G4_1[Create an item using ItemWizard]
G4 --> G4_2[Ensure other wizards can interact with the item]
G --> G1 --> G2 --> G3 --> G4
```

