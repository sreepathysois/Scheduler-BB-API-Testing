Feature: Cancel a session to a session of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Cancel a session for Scheduler API Smoke Test   

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session with sessionId "<session_id>" for smoke testing
When a Delete request for an endpoint /session/cancel_session/ is triggered to Cancel a session for scheduler block
Then response code of Delete request is "200" for smoke testing

Examples:
 | requestor_Entity | requestor_Role | session_id |
 | healthngo1       | healthworker   | 4524453535 |



@unit @happyregression  
Scenario Outline: Cancel a session to a session for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session with sessionId "<session_id>" 
When a Delete request for an endpoint /session/cancel_session/ is triggered to Cancel a session for scheduler block 
Then response code of Delete request is "200"

Examples:
 | requestor_Entity | requestor_Role | session_id | 
 | healthngo1       | healthworker   | 4524453535 |  
  

@unit @Negativeregression  
Scenario Outline: Cancel a session to a session for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session with sessionId "<session_id>"
When a Delete request for an endpoint /session/cancel_session/ is triggered to Cancel a session for scheduler block 
Then response code of negative testing Delete request for invalid data is "<status_code>"


Examples:
  | requestor_Entity | requestor_Role | session_id      |status_code  |
  | healthngo1       | healthworker   | 4524453535      | 400         |
  | healthngo1       | healthworker   | 4524453535      | 403         |
  | healthngo1       | healthworker   | 4524453535      | 404         |
  
