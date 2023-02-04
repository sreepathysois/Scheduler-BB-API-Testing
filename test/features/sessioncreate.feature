Feature: Create Session Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create Session for Scheduler API Smoke Test   

Given the "<RequestorEntity>" and "<RequestorRole>" 
When I want to create new session using POST request    
Then the response should return sessionID "4524458935" 
And response code of POST request is "200"


@unit  
Scenario Outline: Create Session for Scheduler API Smoke Test   

Given the "<RequestorEntity>" and "<RequestorRole>" 
When I want to create new session using POST request    
Then the response should return sessionID with "<SessionID>" 
And response code of POST request is "200"

Examples:
  |RequestorEntity | RequestorRole |SessionID |
  |practo          | admin         |4524458935 |
  |mahe            | hr            |4524458935 |
  |practo          | admin         |4524458935 |
  |mahe            | hr            |4524458935 |

