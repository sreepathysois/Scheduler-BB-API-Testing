Feature: Deallocate a Resource of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Deallocate a Resource for Scheduler API Smoke Test   

#Given the requestor entity is "healthngo1" with role as "healthworker" for a session "sessionId" with resource_Id "4524453535" to deallocate a resources
Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session "<sessionId>" with resource_Id "<resourceId>" to deallocate a resources for smoke testing 
When a Delete request for an endpoint /resources/deallocate_resources/ is triggered to deallocate resource for scheduler block      
Then response code of Delete request is "200" for smoke testing


Examples:
  | requestor_Entity | requestor_Role | sessionId | resourceId |
  | healthngo1       | healthworker   | test      | 4524453535 |

@unit @happyregression  
Scenario Outline: Deallocate a Resource for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session "<sessionId>" with resource_Id "<resourceId>" to deallocate a resources
When a Delete request for an endpoint /resources/deallocate_resources/ is triggered to deallocate resource for scheduler block
Then response code of Delete request is "200"

Examples:
  | requestor_Entity | requestor_Role | sessionId | resourceId |
  | healthngo1       | healthworker   | test      | 4524453535 |
  

@unit @Negativeregression  
Scenario Outline: Deallocate a Resource for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session "<sessionId>" with resource_Id "<resourceId>" to deallocate a resources
When a Delete request for an endpoint /resources/deallocate_resources/ is triggered to deallocate resource for scheduler block
Then response code of negative testing Delete request for invalid data is "<status_code>"


Examples:
  | requestor_Entity | requestor_Role | sessionId | resourceId | status_code |
  | healthngo1       | healthworker   | test      | 4524453535 | 400         |
  | healthngo1       | healthworker   | test      | 4524453535 | 403         |
  | healthngo1       | healthworker   | test      | 4524453535 | 404         |
  

