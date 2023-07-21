Feature: Create a new Alert of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new Alert for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" to create a new alert
When a POST request for an endpoint /alert/create_alert/ is triggered to create new alert for scheduler block      
Then the result should return alertId as "6724453535" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new Alert for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to create a new alert with category "<alertcategory>" and message "<alertMessage>" for an entityId "<entityId>" with resource and subscriber Ids are "<resource_ids>" "<subscriber_ids>"
When a POST request for an endpoint /alert/create_alert/ is triggered to create new alert for scheduler block
Then the result should return alertId as "<alertId>" for requested entity
And response code of POST request is "200"

Examples: 
  | requestor_Entity | requestor_Role | alertcategory | alertMessage        | entityId       | resource_ids   | subscriber_ids | alertId   | 
  | healthngo1       | healthworker   | health        | resource threshold  | he2            | bed,icu        | mahe           | 6724453535|
  

@unit @Negativeregression  
Scenario Outline: Create a new Alert for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to create a new alert with category "<alertcategory>" and message "<alertMessage>" for an entityId "<entityId>" with resource and subscriber Ids are "<resource_ids>" "<subscriber_ids>"
When a POST request for an endpoint /alert/create_alert/ is triggered to create new alert for scheduler block
Then the result should not return an alertId object "<alertId>" for requested entiyty
And response code of negative testing POST request for invalid data is "<status_code>" 


Examples:
  | requestor_Entity | requestor_Role | alertcategory | alertMessage       | entityId | resource_ids | subscriber_ids | alertId    | status_code |
  | healthngo1       | healthworker   | health        | resource threshold | he2      | bed,icu      | mahe           | 4524453535 | 400         |
  | healthngo1       | healthworker   | health        | resource threshold | he2      | bed,icu      | mahe           | 4524453535 | 403         |
  | healthngo1       | healthworker   | health        | resource threshold | he2      | bed,icu      | mahe           | 4524453535 | 404         |
