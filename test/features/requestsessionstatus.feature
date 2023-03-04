Feature: Request Session Status of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Request Session Status for Scheduler API Smoke Test   

#Given the requestor entity is "healthngo1" with role as "healthworker" for a session token  "healthsession" for targer BB Id "target_BB_Id" for smoke testing
Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session token  "<sessiontoken>" for targer BB Id "<target_BB_Id>" for smoke testing   
When a GET request for an endpoint /session/request_session_Status/ is triggered to get status of session      
Then response code of GET request is "200" for smoke testing 

Examples:
  | requestor_Entity | requestor_Role | sessiontoken | target_BB_Id | sessionstatus |
  | healthngo1       | healthworker   | 4524453535   | target_BB_Id | sucess        |   

@unit @happyregression  
Scenario Outline: Request Session Status for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session token  "<sessiontoken>" for targer BB Id "<target_BB_Id>"  
When a GET request for an endpoint /session/request_session_Status/ is triggered to get status of session
Then the result should return session status as "<sessionstatus>"
And response code of GET request is "200"

Examples:
  | requestor_Entity | requestor_Role | sessiontoken | target_BB_Id | sessionstatus |
  | healthngo1       | healthworker   | 4524453535   | target_BB_Id | sucess        |   
  

@unit @Negativeregression  
Scenario Outline: Request Session Status for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a session token  "<sessiontoken>" for targer BB Id "<target_BB_Id>"
When a GET request for an endpoint /session/request_session_Status/ is triggered to get status of session
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
   | requestor_Entity | requestor_Role | sessiontoken | target_BB_Id | sessionstatus | status_code |
   | healthngo1       | healthworker   | 4524453535   | target_BB_Id | sucess        | 400         |
   | healthngo1       | healthworker   | 4524453535   | target_BB_Id | sucess        | 403         |
   | healthngo1       | healthworker   | 4524453535   | target_BB_Id | sucess        | 404         |
