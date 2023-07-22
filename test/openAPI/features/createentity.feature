Feature: Create a new entity of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new entity for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" to create a new entity
When a POST request for an endpoint /entity/create_entity/ is triggered to create new entity for scheduler block      
Then the result should return entity Id as "4524453535" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new entity for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to create a entity with name "<entityname>" with following details like "<phone_no>" "<email_id>" with home page url "<url>" for a specified "<location>" with its category as "<entitycategory>"
When a POST request for an endpoint /entity/create_entity/ is triggered to create new entity for scheduler block
Then the result should return entity id as "<entity_id>" for requested entity
And response code of POST request is "200"

Examples: 
  | requestor_Entity | requestor_Role | entityname | phone_no   | email_id       | url              | location | entitycategory | entity_id |
  | healthngo1       | healthworker   | practo     | 9980555504 | sree@gmail.com | http://alert.com | Bangalore| hsopital       |4524453535|
  

@unit @Negativeregression  
Scenario Outline: Create a new entity for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to create a entity with name "<entityname>" with following details like "<phone_no>" "<email_id>" with home page url "<url>" for a specified "<location>" with its category as "<entitycategory>"
When a POST request for an endpoint /entity/create_entity/ is triggered to create new entity for scheduler block
Then the result should not return a entity Id object "<entity_id>" for requested entiyty
And response code of negative testing POST request for invalid data is "<status_code>" 


Examples:
  | requestor_Entity | requestor_Role | entityname | phone_no   | email_id       | url              | location | entitycategory | entity_id| status_code |
  | healthngo1       | healthworker   | practo     | 9980555504 | sree@gmail.com | http://alert.com | Bangalore| hsopital       | 4423455  | 400         |
  | healthngo1       | healthworker   | practo     | 9980555504 | sree@gmail.com | http://alert.com | Bangalore| hsopital       | 4423455  | 403         |
  | healthngo1       | healthworker   | practo     | 9980555504 | sree@gmail.com | http://alert.com | Bangalore| hsopital       | 4423455  |404          |
  
