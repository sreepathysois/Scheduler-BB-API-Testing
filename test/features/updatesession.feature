Feature: Update a session of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update a session for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" to update an session with its ID "4524453535"
When an Update request for an endpoint /session/update_session/ is triggered to update existing session for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update a session for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to update a session with its ID "<session_id>" for a given date range from "<startDate>" to "<endDate>" with time interval from "<startTime>" to "<endTime>" for an "<activity>" with "<session_name>" with further inputs like "<hostentityId>" with "<subscriber_limit>" and "<session_charges>" in "<currency>" for a specific "<terms_conditions>" with following "<instructions>"
When an Update request for an endpoint /session/update_session/ is triggered to update existing session for scheduler block 
Then response code of Update request is "200"
Examples:
  | requestor_Entity | requestor_Role | session_id | session_name | status | startDate | startTime      | endDate     | endTime       | activity | hostentityId | subscriber_limit | session_charges | currency | terms_conditions | instructions |
  | healthngo1       | healthworker   | 4524453535 | consultation | active | 2023-02-04| 08:44:44.683Z  | 2023-02-04  | 08:44:44.683Z | pysio    | he1          | 10               | 1               | usd      | no refund        | get records  | 
  

@unit @Negativeregression  
Scenario Outline: Update a session for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to update a session with its ID "<session_id>" for a given date range from "<startDate>" to "<endDate>" with time interval from "<startTime>" to "<endTime>" for an "<activity>" with "<session_name>" with further inputs like "<hostentityId>" with "<subscriber_limit>" and "<session_charges>" in "<currency>" for a specific "<terms_conditions>" with following "<instructions>"
When an Update request for an endpoint /session/update_session/ is triggered to update existing session for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"


Examples:
 | requestor_Entity | requestor_Role | session_id | session_name | status | startDate | startTime     | endDate    | endTime       | activity | hostentityId | subscriber_limit | session_charges | currency | terms_conditions | instructions | status_code |
 | healthngo1       | healthworker   | 4524453535 | consultation | active | 2023-02-04| 08:44:44.683Z | 2023-02-04 | 08:44:44.683Z | pysio    | he1          | 10               | 1               | usd      | no refund        | get records  | 400         |
 | healthngo1       | healthworker   | 4524453535 | consultation | active | 2023-02-04| 08:44:44.683Z | 2023-02-04 | 08:44:44.683Z | pysio    | he1          | 10               | 1               | usd      | no refund        | get records  | 403         |
 | healthngo1       | healthworker   | 4524453535 | consultation | active | 2023-02-04| 08:44:44.683Z | 2023-02-04 | 08:44:44.683Z | pysio    | he1          | 10               | 1               | usd      | no refund        | get records  | 404         |

