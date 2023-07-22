Feature: Get List of Session Resources of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get List of Session Resources for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" with sessionId "sessionId"
When a GET request for an endpoint /resource/get_resource_list/ is triggered to get list of resource      
Then the result should return subscriber details about "subscriber_id" and "subscriber_name"
And response code of GET request is "200" for smoke testing 




@unit @happyregression  
Scenario Outline: Get List of Session Resources for  Scheduler API Unit and Regression Happy Testing


Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" with sessionId "<sessionId>" for resource with id "<resource_id>"  "<resource_category>" "<name>" "<phone_no>" "<email_id>" for "<alert_url>" with alert mode "<alertMode>"  for a entity "<entityId>" in "<location>"
When a GET request for an endpoint /resource/get_resource_list/ is triggered to get list of resource
Then the result should return subscriber details about "<subscriber_id>" and "<subscriber_name>"
And response code of GET request is "200"

Examples:
  | requestor_Entity | requestor_Role | sessionId | resource_id | resource_category | name | phone_no    | email_id       | alert_url        | alertMode | entityId | location | subscriber_id | subscriber_name |
  | healthngo1       | healthworker   | he1       | 4524453535  | bed               | sree | 99805555504 | sree@gmail.com | http://alert.com | urgent    | he1       | Bangalore| test          | test            |
  

@unit @Negativeregression  
Scenario Outline: Get List of Session Resources for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity "<requestor_Entity>" with role as "<requestor_Role>" with sessionId "<sessionId>" for resource with id "<resource_id>"  "<resource_category>" "<name>" "<phone_no>" "<email_id>" for "<alert_url>" with alert mode "<alertMode>"  for a entity "<entityId>" in "<location>"
When a GET request for an endpoint /resource/get_resource_list/ is triggered to get list of resource
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | sessionId | resource_id | resource_category | name | phone_no    | email_id       | alert_url        | alertMode | entityId | location | status_code |
  | healthngo1       | healthworker   | he1       | 4524453535  | bed               | sree | 99805555504 | sree@gmail.com | http://alert.com | urgent    | he1       | Bangalore| 400         |
  | healthngo1       | healthworker   | he1       | 4524453535  | bed               | sree | 99805555504 | sree@gmail.com | http://alert.com | urgent    | he1       | Bangalore| 403         |
  | healthngo1       | healthworker   | he1       | 4524453535  | bed               | sree | 99805555504 | sree@gmail.com | http://alert.com | urgent    | he1       | Bangalore| 404         |
