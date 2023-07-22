Feature: Get Alert Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Alert Details for Scheduler API Smoke Test   

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an alertId "<alertId>" for smoke testing 
When a GET request for an endpoint /alert/get_alert_details/ is triggered to get details of an alert    
Then response code of GET request is "200" for smoke testing 


Examples:
  | requestor_Entity | requestor_Role | alertId   | 
  | healthngo1       | healthworker   | 4524453535|  


@unit @happyregression  
Scenario Outline: Get Alert Details for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an alertId "<alertId>" 
When a GET request for an endpoint /alert/get_alert_details/ is triggered to get details of an alert
Then the result should return following details of alert with its entityId "<entityId>" with message "<alertMessage>" of category "<alertcategory>" for following resources and its subscriber ids are "<resource_ids>" "<subscriber_ids>"
And response code of GET request is "200"

Examples:
  | requestor_Entity | requestor_Role | alertId | entityId        | alertMessage   | alertcategory   | resource_ids         | subscriber_ids| 
  | healthngo1       | healthworker   | 4524453535| 4524453535    | resources      | health          | icu,bed              | Mahe          | 
  

@unit @Negativeregression  
Scenario Outline: Get Alert Details for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an alertId "<alertId>"
When a GET request for an endpoint /alert/get_alert_details/ is triggered to get details of an alert
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | alertId     | status_code |
  | healthngo1       | healthworker   | myresource  | 400         |
  | healthngo1       | healthworker   | 4524453535  | 403         |
  | healthngo1       | healthworker   | 4524453535  | 404         |
