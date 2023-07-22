Feature: Get List of Entity for Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get List of Entity for Scheduler API Smoke Test   

#Given the requestor entity is "healthngo1" with role as "healthworker" having an entittyId "4524453535"
Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an entity with Id as "<entityId>"
When a GET request for an endpoint /entity/get_entity_list/ is triggered to get list of an entities
When a GET request for an endpoint /entity/get_entity_list/ is triggered to get list of an entities   
Then response code of GET request is "200" for smoke testing 


Examples:
  | requestor_Entity | requestor_Role | entityId   | 
  | healthngo1       | healthworker   | 4524453535 |


@unit @happyregression  
Scenario Outline: Get List of Entity for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an entity with Id as "<entityId>", name as "<entityname>" and with following details like "<phone_no>" "<email_id>" with home page url "<url>" for a specified "<location>" with its category as "<entitycategory>"
When a GET request for an endpoint /entity/get_entity_list/ is triggered to get list of an entities
Then the result should return entity details about "<entity_id>" and "<entity_name>"
And response code of GET request is "200"

Examples:
  | requestor_Entity | requestor_Role | entityId   | entityname | phone_no   | email_id       | url               | location | entitycategory | entity_id | entity_name |
  | healthngo1       | healthworker   | 4524453535 | sreepathy  | 9980555504 | sree@gmail.com | http://entity.com | Bangalore| hospital       | 4524453535| mahe        |
  

@unit @Negativeregression  
Scenario Outline: Get List of Entity for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an entity with Id as "<entityId>", name as "<entityname>" and with following details like "<phone_no>" "<email_id>" with home page url "<url>" for a specified "<location>" with its category as "<entitycategory>"
When a GET request for an endpoint /entity/get_entity_list/ is triggered to get list of an entities
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | entityId   | entityname | phone_no   | email_id       | url               | location | entitycategory | status_code |
  | healthngo1       | healthworker   | 4524453535 | sreepathy  | 9980555504 | sree@gmail.com | http://entity.com | Bangalore| hospital       | 400         |
  | healthngo1       | healthworker   | 4524453535 | sreepathy  | 9980555504 | sree@gmail.com | http://entity.com | Bangalore| hospital       | 403         |
  | healthngo1       | healthworker   | 4524453535 | sreepathy  | 9980555504 | sree@gmail.com | http://entity.com | Bangalore| hospital       | 404         |
