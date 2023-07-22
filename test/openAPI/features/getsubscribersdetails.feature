Feature: Get Subscriber Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Subscriber Details for Scheduler API Smoke Test   

#Given the requestor entity is "healthngo1" with role as "healthworker" for a subscriber_id "4524453535"
Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for subscriber_id "<subscriber_id>" for smoke testing 
When a GET request for an endpoint /subscribers/get_subscriber_details/ is triggered to get details of subscriber      
Then response code of GET request is "200" for smoke testing 


Examples:
  | requestor_Entity | requestor_Role | subscriber_id |  
  | healthngo1       | healthworker   | 4524453535    |    

@unit @happyregression  
Scenario Outline: Get Subscriber Details for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for subscriber_id "<subscriber_id>" 
When a GET request for an endpoint /subscribers/get_subscriber_details/ is triggered to get details of subscriber
Then the result should return following details of subscriber like "<subscriber_category>" "<name>" "<phone_no>" "<email_id>" for alert url "<alert_url>" with alert mode "<alertMode>" for an entity "<entityId>" for a location is "<location>"
And response code of GET request is "200"

Examples:
  | requestor_Entity | requestor_Role | subscriber_id | subscriber_category | name      | phone_no   | email_id       | alert_url        | alertMode     | entityId | location | 
  | healthngo1       | healthworker   | 4524453535    | bed                 | sreepathy | 9980555504 | sree@gmail.com | http://alert.com | urgent        | he1      | Bangalore|   
  

@unit @Negativeregression  
Scenario Outline: Get Subscriber Details for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for subscriber_id "<subscriber_id>" 
When a GET request for an endpoint /subscribers/get_subscriber_details/ is triggered to get details of subscriber
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | subscriber_id | status_code |
  | healthngo1       | healthworker   | myresource  | 400         |
  | healthngo1       | healthworker   | 4524453535  | 403         |
  | healthngo1       | healthworker   | 4524453535  | 404         |
