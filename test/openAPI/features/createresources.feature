Feature: Create Resources of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create Resources for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" to create a new resources
When a POST request for an endpoint /resources/create_resources/ is triggered to create new resources for scheduler block       
Then the result should return resource id as "4524453535" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create Resources for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for resource category "<resource_category>" with following details like "<name>" "<phone_no>" "<email_id>" for alert url "<alert_url>" with alert mode "<alertMode>" for an entity "<entityId>" for a specified "<location>"
When a POST request for an endpoint /resources/create_resources/ is triggered to create new resources for scheduler block
Then the result should return resource id as "<Resource_ID>" for requested resources
And response code of POST request is "200"

Examples:
  | requestor_Entity | requestor_Role | resource_category | name      | phone_no   | email_id       | alert_url        | alertMode     | entityId | location | Resource_ID |
  | healthngo1       | healthworker   | bed               | sreepathy | 9980555504 | sree@gmail.com | http://alert.com | urgent        | he1      | Bangalore| 4524453535  |
  

@unit @Negativeregression  
Scenario Outline: Create Resources for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for resource category "<resource_category>" with following details like "<name>" "<phone_no>" "<email_id>" for alert url "<alert_url>" with alert mode "<alertMode>" for an entity "<entityId>" for a specified "<location>"
When a POST request for an endpoint /resources/create_resources/ is triggered to create new resources for scheduler block
Then the result should not return a ResourceID object "<Resource_ID>" for requested resources
And response code of negative testing POST request for invalid data is "<status_code>" 


Examples:
  | requestor_Entity | requestor_Role | resource_category | name      | phone_no   | email_id       | alert_url        | alertMode     | entityId | location | Resource_ID |status_code|
  | healthngo1       | healthworker   | bed               | sreepathy | 9980555504 | sree@gmail.com | http://alert.com | urgent        | he1      | Bangalore| 4524453535  |400        |
  | healthngo1       | healthworker   | bed               | sreepathy | 9980555504 | sree@gmail.com | http://alert.com | urgent        | he1      | Bangalore| 4524453535  |403        |
  | healthngo1       | healthworker   | bed               | sreepathy | 9980555504 | sree@gmail.com | http://alert.com | urgent        | he1      | Bangalore| 4524453535  |405        |
  
