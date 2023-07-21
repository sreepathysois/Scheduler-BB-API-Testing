Feature: Get List of Session Alerts for Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get List of Session Alerts for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" for a sesion with Id "4524453535"
When a GET request for an endpoint /alert/get_session_alerts/ is triggered to get list of session alerts  
Then response code of GET request is "200" for smoke testing 




@unit @happyregression  
Scenario Outline: Get List of Session Alerts for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a sesion with Id as "<sessionId>" for an alert filters like entityId "<entityId>" with message "<alertMessage>" category of alert "<alertcategory>" for given resources and subscriber ids "<resource_ids>" "<subscriber_ids>"
When a GET request for an endpoint /alert/get_session_alerts/ is triggered to get list of session alerts  
Then the result should return alert details about "<alert_id>" and "<alert_name>"
And response code of GET request is "200"

Examples:
  | requestor_Entity | requestor_Role | sessionId | entityId   | alertMessage    | alertcategory | resource_ids | subscriber_ids | alert_id | alert_name |
  | healthngo1       | healthworker   | 4524453535| 4524453535 | resourcecrunch | health        | bed,icu      | mahe           | 45678    | mytrigger  |
  

@unit @Negativeregression  
Scenario Outline: Get List of Session Alerts for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a sesion with Id as "<sessionId>" for an alert filters like entityId "<entityId>" with message "<alertMessage>" category of alert "<alertcategory>" for given resources and subscriber ids "<resource_ids>" "<subscriber_ids>"
When a GET request for an endpoint /alert/get_session_alerts/ is triggered to get list of session alerts 
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | sessionId | entityId   | alertMessage    | alertcategory | resource_ids | subscriber_ids | status_code |
  | healthngo1       | healthworker   | 4524453535| 4524453535 | resourcecrunch | health        | bed,icu      | mahe           | 400         |
  | healthngo1       | healthworker   | 4524453535| 4524453535 | resourcecrunch | health        | bed,icu      | mahe           | 403         |
  | healthngo1       | healthworker   | 4524453535| 4524453535 | resourcecrunch | health        | bed,icu      | mahe           | 404         |
  
