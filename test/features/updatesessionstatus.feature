Feature: Update a Session Status of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update a Session Status for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" to update an session status for source_BB_Id "source_BB_Id" with sessiontoken "4524453535" and status as "success" for smoke testing
When an Update request for an endpoint /session/update_session_Status/ is triggered to update session status for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update a Session Status for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to update an session status for source_BB_Id "<source_BB_Id>" with sessiontoken "<sessiontoken>" and status as "<status>"
When an Update request for an endpoint /session/update_session_Status/ is triggered to update session status for scheduler block 
Then response code of Update request is "200"
Examples:
  | requestor_Entity | requestor_Role | source_BB_Id | sessiontoken | status |
  | healthngo1       | healthworker   | source_BB_Id | 4524453535   | success|
  

@unit @Negativeregression  
Scenario Outline: Update a Session Status for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to update an session status for source_BB_Id "<source_BB_Id>" with sessiontoken "<sessiontoken>" and status as "<status>"
When an Update request for an endpoint /session/update_session_Status/ is triggered to update session status for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"


Examples:
 | requestor_Entity | requestor_Role | source_BB_Id | sessiontoken | status | status_code |
 | healthngo1       | healthworker   | source_BB_Id | 4524453535   | success| 400         |
 | healthngo1       | healthworker   | source_BB_Id | 4524453535   | success| 403         |
 | healthngo1       | healthworker   | source_BB_Id | 4524453535   | success| 404         |
