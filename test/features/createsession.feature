Feature: Create a new Session of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new Session for Scheduler API Smoke Test   

Given the "healthngo1" and "healthworker" to create a new session
When a POST request for an endpoint /session/create_session/ is triggered to create new session for scheduler block      
Then the result should be a SessionID object "4524458935" of requested session for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new Session for Scheduler API Unit and Regression Happy Testing

Given the "<requestor_Entity>" and "<requestor_Role>" for a given date range from "<startDate>" to "<endDate>" with time interval from "<startTime>" to "<endTime>" for an "<activity>" with "<session_name>" with further inputs like "<hostentityId>" with "<subscriber_limit>" and "<session_charges>" in "<currency>" for a specific "<terms_conditions>" with following "<instructions>"
When a POST request for an endpoint /session/create_session/ is triggered to create new session for scheduler block
Then the result should be a SessionID object "<SessionID>" for requested session
And response code of POST request is "200"

Examples:
  | requestor_Entity | requestor_Role | session_name | status | startDate | startTime      | endDate    | endTime       | activity | hostentityId | subscriber_limit | session_charges | currency | terms_conditions | instructions | SessionID |
  | healthngo1       | healthworker   | consultation | active | 2023-02-04| 08:44:44.683Z | 2023-02-04  | 08:44:44.683Z | pysio    | he1          | 10               | 1               | usd      | no refund        | get records  | 4524458935|
  

@unit @Negativeregression  
Scenario Outline: Create a new Session for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the "<requestor_Entity>" and "<requestor_Role>" for a given date range from "<startDate>" to "<endDate>" with time interval from "<startTime>" to "<endTime>" for an "<activity>" with "<session_name>" with further inputs like "<hostentityId>" with "<subscriber_limit>" and "<session_charges>" in "<currency>" for a specific "<terms_conditions>" with following "<instructions>"
When a POST request for an endpoint /session/create_session/ is triggered to create new session for scheduler block
Then the result should not return a SessionID object "<SessionID>" for requested session
And response code of negative testing POST request for invalid data is "<status_code>" 


Examples:
  | requestor_Entity | requestor_Role | session_name | startDate | startTime     | endDate    | endTime       | activity | hostentityId | subscriber_limit | session_charges | currency | terms_conditions | instructions | SessionID | status_code |
  | healthngo1       | admin          | consultation | 2023-02-04| 08:44:44.683Z | 2023-03-04 | 09:44:44.683Z | pysio    | he1          | 10               | 1               | usd      | no refund        | get records  | 4524458935| 400         |
  | healthngo1       | admin          | consultation | 2023-02-04| 08:44:44.683Z | 2023-03-04 | 09:44:44.683Z | pysio    | he1          | 10               | 1               | usd      | no refund        | get records  | 4524458935| 403         |
  | healthngo1       | admin          | consultation | 2023-02-04| 08:44:44.683Z | 2023-03-04 | 09:44:44.683Z | pysio    | he1          | 10               | 1               | usd      | no refund        | get records  | 4524458935| 404         |
  












