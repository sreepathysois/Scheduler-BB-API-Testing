Feature: Get Session Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Session Details for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" for a session_id "4524453535" for smoke testing
When a GET request for an endpoint /session/get_session_details/ is triggered to get details of session      
Then response code of GET request is "200" for smoke testing 




@unit @happyregression  
Scenario Outline: Get Session Details for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for session_id "<session_id>" 
When a GET request for an endpoint /session/get_session_details/ is triggered to get details of session
Then the result should return following details of session like "<personnel_name>" "<episode_name>" "<event_name>" for following "<resource_ids>" "<subscriber_ids>" for a given date range from "<startDate>" to "<endDate>" with time interval from "<startTime>" to "<endTime>" for an "<activity>" with "<session_name>" with further inputs like "<hostentityId>" with "<subscriber_limit>" and "<session_charges>" in "<currency>" for a specific "<terms_conditions>" with following "<instructions>"
And response code of GET request is "200"

Examples:
  | requestor_Entity | requestor_Role | session_id | personnel_name | episode_name | event_name | resource_ids | subscriber_ids | startDate | startTime     | endDate    | endTime       | activity | session_name | hostentityId | subscriber_limit | session_charges | currency | terms_conditions | instructions |
  | healthngo1       | healthworker   | 4524453535 | sree           | ep1          | itu        | 83295        | 38291          | 2023-02-04| 08:44:44.683Z | 2023-02-04 | 08:44:44.683Z | pysio    | test         | he1          | 10               | 1               | usd      | no refund        | get records  |  

@unit @Negativeregression  
Scenario Outline: Get Session Details for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for session_id "<session_id>" 
When a GET request for an endpoint /session/get_session_details/ is triggered to get details of session
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | session_id  | status_code |
  | healthngo1       | healthworker   | 4524453535  | 400         |
  | healthngo1       | healthworker   | 4524453535  | 403         |
  | healthngo1       | healthworker   | 4524453535  | 404         |
