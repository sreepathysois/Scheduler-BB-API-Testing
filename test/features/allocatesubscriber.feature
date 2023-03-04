Feature: Allocate a Subscriber of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Allocate a Subscriber for Scheduler API Smoke Test   

#Given the requestor entity is "healthngo1" with role as "healthworker" for a session "sessionId" with subscriberId "4524453535" to allocate a subscriber
Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session "<sessionId>" with subscriberId "<subscriberId>" to allocate a subscriber for smoke testing 
When a POST request for an endpoint /subscribers/allocate_subscriber/ is triggered to allocate subscriber for scheduler block      
Then response code of POST request is "200" for smoke testing

Examples:
 | requestor_Entity | requestor_Role | sessionId | subscriberId |
 | healthngo1       | healthworker   | test      | 4524453535   |


@unit @happyregression  
Scenario Outline: Allocate a Subscriber for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session "<sessionId>" with subscriberId "<subscriberId>" to allocate a subscriber
When a POST request for an endpoint /subscribers/allocate_subscriber/ is triggered to allocate subscriber for scheduler block
Then response code of POST request is "200"

Examples:
 | requestor_Entity | requestor_Role | sessionId | subscriberId |
 | healthngo1       | healthworker   | test      | 4524453535   |
  

@unit @Negativeregression  
Scenario Outline: Allocate a Subscriber for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session "<sessionId>" with subscriberId "<subscriberId>" to allocate a subscriber
When a POST request for an endpoint /subscribers/allocate_subscriber/ is triggered to allocate subscriber for scheduler block
Then response code of negative testing POST request for invalid data is "<status_code>"


Examples:
  | requestor_Entity | requestor_Role | sessionId | subscriberId | status_code |
  | healthngo1       | healthworker   | test      | 4524453535   | 400         |
  | healthngo1       | healthworker   | test      | 4524453535   | 403         |
  | healthngo1       | healthworker   | test      | 4524453535   | 404         |
  

