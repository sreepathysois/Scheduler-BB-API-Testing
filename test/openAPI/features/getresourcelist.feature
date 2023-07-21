Feature: Get Resources List of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Resources List for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" having entityId "444"
When a GET request for an endpoint /resource/get_resource_list/ is triggered to get list of resource      
Then response code of GET request is "200" for smoke testing 




@unit @happyregression  
Scenario Outline: Get Resources List for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" having entityId "he1" for resource_id "<resource_id>" of resource category "<resource_category>" with alert mode "<alertMode>"  for a location is "<location>"
When a GET request for an endpoint /resource/get_resource_list/ is triggered to get list of resource
Then the result should return subscriber details about "<subscriber_id>" and "<subscriber_name>"
And response code of GET request is "200"

Examples:
  | requestor_Entity | requestor_Role | entityId | resource_id | resource_category | alertMode | location | subscriber_id | subscriber_name |
  | healthngo1       | healthworker   | 344      | 4524453535  | bed               | urgent    | he1      | test          | test            |
  

@unit @Negativeregression  
Scenario Outline: Get Resources List for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" having entityId "he1" for resource_id "<resource_id>" of resource cateegory "<resource_category>" with alert mode "<alertMode>"  for a location is "<location>" 
When a GET request for an endpoint /resource/get_resource_list/ is triggered to get list of resource
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | entityId | resource_id | resource_category | alertMode | location | status_code |
  | healthngo1       | healthworker   | 333      | 4524453535  | bed               | urgent    | he1      | 400         |
  | healthngo1       | healthworker   | 333      | 4524453535  | bed               | urgent    | he1      | 403         |
  | healthngo1       | healthworker   | 333      | 4524453535  | bed               | urgent    | he1      | 404         |
  | healthngo1       | healthworker   | 333      | 4524453535  | bed               | urgent    | he1      | 405         |
