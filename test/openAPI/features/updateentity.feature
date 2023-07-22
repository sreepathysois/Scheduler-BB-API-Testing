Feature: Update an entity of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update an entity for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" to update an entity with its ID "4524453535"
When an Update request for an endpoint /entity/update_entity/ is triggered to update existing entity for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update an entity for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an entity with Id "<entity_id>" to update an entity with name "<entityname>" with following details like "<phone_no>" "<email_id>" with home page url "<url>" for a specified "<location>" with its category as "<entitycategory>"
When an Update request for an endpoint /entity/update_entity/ is triggered to update existing entity for scheduler block 
Then response code of Update request is "200"
Examples:
  | requestor_Entity | requestor_Role | entity_id | entityname      | phone_no   | email_id       | url               | location | entitycategory |
  | healthngo1       | healthworker   | 4524453535| sreepathy | 9980555504 | sree@gmail.com | http://entity.com | Bangalore| hospital       |
  

@unit @Negativeregression  
Scenario Outline: Update an entity for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an entity with Id "<entity_id>" to update an entity with name "<entityname>" with following details like "<phone_no>" "<email_id>" with home page url "<url>" for a specified "<location>" with its category as "<entitycategory>"
When an Update request for an endpoint /entity/update_entity/ is triggered to update existing entity for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"


Examples:
  | requestor_Entity | requestor_Role | entity_id | entityname      | phone_no   | email_id       | url               | location | entitycategory | status_code |
  | healthngo1       | healthworker   | 4524453535| sreepathy | 9980555504 | sree@gmail.com | http://entity.com | Bangalore| hospital       | 400         |
  | healthngo1       | healthworker   | 4524453535| sreepathy | 9980555504 | sree@gmail.com | http://entity.com | Bangalore| hospital       | 403         |
  | healthngo1       | healthworker   | 4524453535| sreepathy | 9980555504 | sree@gmail.com | http://entity.com | Bangalore| hospital       | 404         |
  

