Feature: Affiliate an Entity of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Affiliate an Entity for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" for an entity with entityId "4524453535" 
When a POST request for an endpoint /entity/affiliate_entity/ is triggered to affiliate an entity for scheduler block      
Then response code of POST request is "200" for smoke testing


@unit @happyregression  
Scenario Outline: Affiliate an Entity for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an entity with entityId "<entityId>" with its target Id as "<targetId>" in a category "<targetcategory>"
When a POST request for an endpoint /entity/affiliate_entity/ is triggered to affiliate an entity for scheduler block  
Then response code of POST request is "200"

Examples:
 | requestor_Entity | requestor_Role | entityId | targetId   | targetcategory |
 | healthngo1       | healthworker   | test     | 4524453535 | hosp           |
  

@unit @Negativeregression  
Scenario Outline: Affiliate an Entity for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for an entity with entityId "<entityId>" with its target Id as "<targetId>" in a category "<targetcategory>"
When a POST request for an endpoint /entity/affiliate_entity/ is triggered to affiliate an entity for scheduler block 
Then response code of negative testing POST request for invalid data is "<status_code>"


Examples:
  | requestor_Entity | requestor_Role | entityId | targetId   | targetcategory | status_code |
  | healthngo1       | healthworker   | test     | 4524453535 | hsop           | 400         |
  | healthngo1       | healthworker   | test     | 4524453535 | education      | 403         |
  | healthngo1       | healthworker   | test     | 4524453535 | academics      | 404         |
  

