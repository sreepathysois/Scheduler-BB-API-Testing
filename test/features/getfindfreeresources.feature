Feature: Get/Find Free Resources Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get/Find Free Resources Details for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" to find free resources of EntityId "Hosp1" for "doctor" category of resources with coinciding valus as "true" 
When a GET request for an endpoint /find_free_resources/ is triggered to get/find details of free resources     
Then response code of GET request is "200" for smoke testing 




@unit @happyregression  
Scenario Outline: Get/Find Free Resources Details for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to find free resources of EntityId "<EntityId>" for "<category>" category of resources with coinciding valus as "<coinciding>" for a given date range from "<startdate>" to "<enddate>"
When a GET request for an endpoint /find_free_resources/ is triggered to get/find details of free resources
Then the result should be a date object of "<From>" and "<To>" for requested resources
And response code of GET request is "200"

Examples:
  |requestor_Entity| requestor_Role|EntityId      | coinciding |category     |startdate                |enddate                   | From                | To                   |
  |healthngo1      | healthworker  | Hosp1        |  true      |doctor       |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo2      | healthworker  | Hosp1        |  false     |doctor       |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo3      | healthworker  | Hosp2        |  true      |bed          |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo4      | healthworker  | Hosp3        |  true      |icu          |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  

@unit @Negativeregression  
Scenario Outline: Get/Find Free Resources Details for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to find free resources of EntityId "<EntityId>" for "<category>" category of resources with coinciding valus as "<coinciding>" for a given date range from "<startdate>" to "<enddate>" 
When a GET request for an endpoint /find_free_resources/ is triggered to get/find details of free resources
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | EntityId | coinciding | category | startdate                | enddate                  | From                 | To                   | status_code |
  | healthngo1       | admin          | Hosp1    | true       | doctor   | 2023-02-04T08:44:44.683Z | 2023-02-04T08:44:44.683Z | 2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z | 400         |
  | healthngo1       | healthworker   | Hosp1    | true       | lawyer   | 2023-02-04T08:44:44.683Z | 2023-02-04T08:44:44.683Z | 2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z | 402         |
  | healthngo1       | healthworker   | Hosp1    | true       | bed      | 2023-02-04T08:44:44.683Z | 2023-02-04T08:44:44.683Z | 2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z | 403         |
  | healthngo1       | healthworker   | Hosp3    | true       | ambulance| 2023-02-04T08:44:44.683Z | 2023-02-04T08:44:44.683Z | 2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z | 404         |
















  
