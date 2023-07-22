Feature: Get Subscribers List of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Subscribers List for Scheduler API Smoke Test   

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" having entityId "<entityId>"
When a GET request for an endpoint /subscribers/get_subscriber_list/ is triggered to get list of subscriber     
Then response code of GET request is "200" for smoke testing 


Examples:
  | requestor_Entity | requestor_Role | entityId | 
  | healthngo1       | healthworker   | he1      |


@unit @happyregression  
Scenario Outline: Get Subscribers List for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>"  for entityId "<entityId>" having subscriber_id "<subscriber_id>" of subscriber category "<subscriber_category>" with alert mode "<alertMode>"  for a location is "<location>"
When a GET request for an endpoint /subscribers/get_subscriber_list/ is triggered to get list of subscriber
Then the result should return subscriber details about "<subscriber_id>" and "<subscriber_name>"
And response code of GET request is "200"

Examples:
  | requestor_Entity | requestor_Role | subscriber_id | entityId | subscriber_category | alertMode | location | subscriber_id | subscriber_name |
  | healthngo1       | healthworker   | 4524453535    | he1      | bed                 | urgent    | he1      | test          | test            |
  

@unit @Negativeregression  
Scenario Outline: Get Subscriberss List for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>"  for entityId "<entityId>" having subscriber_id "<subscriber_id>" of subscriber category "<subscriber_category>" with alert mode "<alertMode>"  for a location is "<location>"
When a GET request for an endpoint /subscribers/get_subscriber_list/ is triggered to get list of subscriber
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | subscriber_id | entityId | subscriber_category | alertMode | location | status_code |
  | healthngo1       | healthworker   | 4524453535    | he1      | bed                 | urgent    | bangalore| 400         |
  | healthngo1       | healthworker   | 4524453535h   | he1      | bed                 | urgent    | mysore   | 403         |
  | healthngo1       | healthworker   | 4524453535    | he2      | bed                 | urgent    | mysore   | 404         |
  | healthngo1       | healthworker   | 4524453535    | he2      | bed                 | urgent    | bangalore| 405         |
