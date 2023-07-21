Feature: Get/Find Free Resource Slots of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get/Find Free Resource Slots for Scheduler API Smoke Test   

Given the requestor entity is "healthngo1" with role as "healthworker" to find free resources slots for given resourceIds "doctor" with coinciding as "true"
When a GET request for an endpoint /find_free_resource_slots/ is triggered to get/find slots of free resources     
Then response code of GET request is "200" for smoke testing 




@unit @happyregression  
Scenario Outline: Get/Find Free Resource Slots for  Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to find free resources slots for a given resourceIds "<resourceIds>"  with coinciding value as "<coinciding>" for a given date range from "<startdate>" to "<enddate>"
When a GET request for an endpoint /find_free_resource_slots/ is triggered to get/find slots of free resources
Then the result should be a date object of "<From>" and "<To>" for requested resources slots
And response code of GET request is "200"

Examples:
  |requestor_Entity| requestor_Role|resourceIds   | coinciding | startdate               |enddate                   | From                | To                   |
  |healthngo1      | admin         | Doctor       |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo2      | healthworker  | Lawyer       |  false     |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo3      | healthworker  | ICU          |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo4      | healthworker  | Lab          |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |


@unit @Negativeregression  
Scenario Outline: Get/Find Free Resource Slots for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" to find free resources slots for a given resourceIds "<resourceIds>"  with coinciding value as "<coinciding>" for a given date range from "<startdate>" to "<enddate>"
When a GET request for an endpoint /find_free_resource_slots/ is triggered to get/find slots of free resources
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_Entity | requestor_Role | resourceIds | coinciding | startdate                | enddate                  | From                 | To                   | status_code |
  | healthngo1       | healthworker   | Doctor      | true       | 2023-02-04T08:44:44.683Z | 2023-02-04T08:44:44.683Z | 2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z | 400         |
  | healthngo2       | healthworker   | Nurse       | false      | 2023-02-04T08:44:44.683Z | 2023-02-04T08:44:44.683Z | 2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z | 402         |
  | healthngo3       | healthworker   | ICU         | true       | 2023-02-04T08:44:44.683Z | 2023-02-04T08:44:44.683Z | 2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z | 403         |
  | healthngo4       | healthworker   | Lab         | true       | 2023-02-04T08:44:44.683Z | 2023-02-04T08:44:44.683Z | 2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z | 404         |

















  
