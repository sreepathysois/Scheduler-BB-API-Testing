Feature: Get Entity Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Entity Details for Scheduler API Smoke Test   

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an entity_id "<entity_id> for smoke testing"
When a GET request for an endpoint /entity/get_entity_details/ is triggered to get details of an entity     
Then response code of GET request is "200" for smoke testing 



Examples:
  | requestor_Entity | requestor_Role | entity_id   | 
  | healthngo1       | healthworker   | 4524453535  | 


@unit @happyregression  
Scenario Outline: Get Entity Details for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an entity_id "<entity_id>" 
When a GET request for an endpoint /entity/get_entity_details/ is triggered to get details of an entity
Then the result should return following details of entity with its name "<entityname>" and with following details like "<phone_no>" "<email_id>" with home page url "<url>" for a specified "<location>" with its category as "<entitycategory>"
And response code of GET request is "200"

Examples:
  | requestor_Entity | requestor_Role | entity_id | entityname | phone_no   | email_id       | url              | location | entitycategory |
  | healthngo1       | healthworker   | 4524453535| mahe       | 9980555504 | sree@gmail.com | http://alert.com | Mangalore| hspital        |
  

@unit @Negativeregression  
Scenario Outline: Get Entity Details for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an entity_id "<entity_id>" 
When a GET request for an endpoint /entity/get_entity_details/ is triggered to get details of an entity
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | entity_id   | status_code |
  | healthngo1       | healthworker   | myresource  | 400         |
  | healthngo1       | healthworker   | 4524453535  | 403         |
  | healthngo1       | healthworker   | 4524453535  | 404         |
