Feature: Update Resources of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update Resources for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" to update  a resource with its id "4524453535"
When an Update request for an endpoint /resources/update_resources/ is triggered to update existing resources for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update Resources for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a resource with Id "<resource_id>" to update details for resource category "<resource_category>" with following details like "<name>" "<phone_no>" "<email_id>" for alert url "<alert_url>" with alert mode "<alertMode>" for an entity "<entityId>" for a specified "<location>"
When an Update request for an endpoint /resources/update_resources/ is triggered to update existing resources for scheduler block 
Then response code of Update request is "200"

Examples:
  | requestor_Entity | requestor_Role | resource_id | resource_category | name      | phone_no   | email_id       | alert_url        | alertMode | entityId | location | 
  | healthngo1       | healthworker   | 4524453535  | bed               | sreepathy | 9980555504 | sree@gmail.com | http://alert.com | urgent    | he1      | Bangalore| 
  

@unit @Negativeregression  
Scenario Outline: Update Resources for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a resource with Id "<resource_id>" to update details for resource category "<resource_category>" with following details like "<name>" "<phone_no>" "<email_id>" for alert url "<alert_url>" with alert mode "<alertMode>" for an entity "<entityId>" for a specified "<location>"
When an Update request for an endpoint /resources/update_resources/ is triggered to update existing resources for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"


Examples:
  | requestor_Entity | requestor_Role | resource_id | resource_category | name      | phone_no   | email_id       | alert_url        | alertMode | entityId | location | status_code |
  | healthngo1       | healthworker   | 4524453535  | bed               | sreepathy | 9980555504 | sree@gmail.com | http://alert.com | urgent    | he1      | Bangalore|  400        |
  | healthngo1       | healthworker   | 4524453535  | bed               | sreepathy | 9980555504 | sree@gmail.com | http://alert.com | urgent    | he1      | Bangalore|  403        |
  | healthngo1       | healthworker   | 4524453535  | bed               | sreepathy | 9980555504 | sree@gmail.com | http://alert.com | urgent    | he1      | Bangalore|  404        |
