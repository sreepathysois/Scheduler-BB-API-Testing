Feature: Update an existing alert of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update an existing alert for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" to update an existing alert with its ID "4524453535"
When an Update request for an endpoint /alert/update_alert/ is triggered to update an existing alert for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update an existing alert for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an existing alert with Id "<alertId>" to update an alert category "<alertcategory>" and message "<alertMessage>" for an entityId "<entityId>" with resource and subscriber Ids are "<resource_ids>" "<subscriber_ids>"
When an Update request for an endpoint /alert/update_alert/ is triggered to update an existing alert for scheduler block
Then response code of Update request is "200"
Examples:
  | requestor_Entity | requestor_Role | alertId    | alertcategory | alertMessage        | entityId       | resource_ids   | subscriber_ids | 
  | healthngo1       | healthworker   | 4524453535 |health         | resource threshold  | he2            | bed,icu        | mahe           | 
  
  

@unit @Negativeregression  
Scenario Outline: Update an existing alert for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an existing alert with Id "<alertId>" to update an alert category "<alertcategory>" and message "<alertMessage>" for an entityId "<entityId>" with resource and subscriber Ids are "<resource_ids>" "<subscriber_ids>"
When an Update request for an endpoint /alert/update_alert/ is triggered to update an existing alert for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"


Examples:
   | requestor_Entity | requestor_Role | alertId    | alertcategory | alertMessage       | entityId | resource_ids | subscriber_ids | status_code |
   | healthngo1       | healthworker   | 4524453535 | health        | resource threshold | he2      | bed,icu      | mahe           | 400         |
   | healthngo1       | healthworker   | 4524453535 | health        | resource threshold | he2      | bed,icu      | mahe           | 403         |
   | healthngo1       | healthworker   | 4524453535 | health        | resource threshold | he2      | bed,icu      | mahe           | 404         |
  
  

