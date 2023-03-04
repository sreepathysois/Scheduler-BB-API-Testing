Feature: Deallocate an alert to a session of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Deallocate an alert to a session for Scheduler API Smoke Test   

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session with sessionId "<sessionId>" and alertId "<alertId>" for smoke testing 
When a Delete request for an endpoint /alert/deallocate_alert/ is triggered to deallocate an alert to a session for scheduler block      
Then response code of Delete request is "200" for smoke testing

Examples:
 | requestor_Entity | requestor_Role | sessionId | alertId   | 
 | healthngo1       | healthworker   | test     | 4524453535 | 

@unit @happyregression  
Scenario Outline: Deallocate an alert to a session for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session with sessionId "<sessionId>" and alertId "<alertId>"
When a Delete request for an endpoint /alert/deallocate_alert/ is triggered to deallocate an alert to a session for scheduler block 
Then response code of Delete request is "200"

Examples:
 | requestor_Entity | requestor_Role | sessionId | alertId   | 
 | healthngo1       | healthworker   | test     | 4524453535 | 
  

@unit @Negativeregression  
Scenario Outline: Deallocate an alert to a session for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session with sessionId "<sessionId>" and alertId "<alertId>"
When a Delete request for an endpoint /alert/deallocate_alert/ is triggered to deallocate an alert to a session for scheduler block 
Then response code of negative testing Delete request for invalid data is "<status_code>"


Examples:
  | requestor_Entity | requestor_Role | sessionId       | alertId    |  status_code    |
  | healthngo1       | healthworker   | 4524453535      | 4524453535 |     400         |
  | healthngo1       | healthworker   | 4524453535      | 4524453535 |     403         |
  | healthngo1       | healthworker   | 4524453535      | 4524453535 |     404         |
  
