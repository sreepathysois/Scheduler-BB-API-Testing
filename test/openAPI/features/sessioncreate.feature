Feature: Create Session Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create Session for Scheduler API Smoke Test   

Given a endpoint to create new session using POST request 
When  the "healthngo1" and "healthworker" for a given date range from "2023-02-04T08:44:44.683Z" to "2023-02-04T09:44:44.683Z"       
Then the result should be a SessionID object "4524458935" for requested resources for smoke testing
And response code of POST request is "200" for smoke testing 


@unit @happyregression  
Scenario Outline: Create Session for Scheduler API Unit and Regression Happy Testing

Given a endpoint to create new session using POST request 
When the "<requestor_Entity>" and "<requestor_Role>" for a given date range from "<startDate>" to "<endDate>" with time interval from "<startTime>" to "<endTime>" for an "<activity>" with "<session_name>" with further inputs like "<hostentityId>" with "<subscriber_limit>" and "<session_charges>" in "<currency>" for a specific "<terms_conditions>" with following "<instructions>"    
Then the result should be a SessionID object "<SessionID>" for requested resources
And response code of POST request is "200"

Examples:
  | requestor_Entity | requestor_Role | session_name | status | startDate | startTime      | endDate    | endTime       | activity | hostentityId | subscriber_limit | session_charges | currency | terms_conditions | instructions | SessionID |
  | healthngo1       | healthworker   | consultation | active | 2023-02-04| 08:44:44.683Z | 2023-02-04 | 08:44:44.683Z | pysio    | he1          | 10               | 1               | usd      | no refund        | get records  | 4524458935|
  

@unit @Negativeregression  
Scenario Outline: Create Session for Scheduler API Unit and Regression Negative Testing

Given a endpoint to create new session using POST request
When the invalid inputs for "<requestor_Entity>" and "<requestor_Role>" for a given date range from "<startDate>" to "<endDate>" with time interval from "<startTime>" to "<endTime>" for an "<activity>" with "<session_name>" with further inputs like "<hostentityId>" with "<subscriber_limit>" and "<session_charges>" in "<currency>" for a specific "<terms_conditions>" with following "<instructions>"    
Then the result should not return a SessionID object "<SessionID>" for requested resources
And response code of negative testing POST request for invalid data is not "200" 


Examples:
  | requestor_Entity | requestor_Role | session_name | startDate | startTime      | endDate    | endTime       | activity | hostentityId | subscriber_limit | session_charges | currency | terms_conditions | instructions | SessionID |
  | healthngo1       | admin          | consultation | 2023-02-04| 08:44:44.683Z | 2023-03-04 | 09:44:44.683Z | pysio    | he1          | 10               | 1               | usd      | no refund        | get records  | 4524458935|
  

