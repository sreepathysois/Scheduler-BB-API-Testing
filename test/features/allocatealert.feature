Feature: Allocate an alert to a session of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Allocate an alert to a session for Scheduler API Smoke Test   

#Given the requestor entity is "healthngo1" with role as "healthworker" for a session with sessionId "4524453535" and alertId "4524453535"
Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session with sessionId "<sessionId>" and alertId "<alertId>" for smoke testing 
When a POST request for an endpoint /alert/allocate_alert/ is triggered to allocate an alert to a session for scheduler block      
Then response code of POST request is "200" for smoke testing

Examples:
 | requestor_Entity | requestor_Role | sessionId | alertId         | 
 | healthngo1       | healthworker   | test      | 4523353535      | 

@unit @happyregression  
Scenario Outline: Allocate an alert to a session for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session with sessionId "<sessionId>" and alertId "<alertId>"
When a POST request for an endpoint /alert/allocate_alert/ is triggered to allocate an alert to a session for scheduler block 
Then response code of POST request is "200"

Examples:
 | requestor_Entity | requestor_Role | sessionId | alertId         | 
 | healthngo1       | healthworker   | test      | 4523353535      | 
  

@unit @Negativeregression  
Scenario Outline: Allocate an alert to a session for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session with sessionId "<sessionId>" and alertId "<alertId>"
When a POST request for an endpoint /alert/allocate_alert/ is triggered to allocate an alert to a session for scheduler block 
Then response code of negative testing POST request for invalid data is "<status_code>"


Examples:
  | requestor_Entity | requestor_Role | sessionId       | alertId    |  status_code    |
  | healthngo1       | healthworker   | 4524453535      | 4524453535 |     400         |
  | healthngo1       | healthworker   | 4524453535      | 4524453535 |     403         |
  | healthngo1       | healthworker   | 4524453535      | 4524453535 |     404         |
  
