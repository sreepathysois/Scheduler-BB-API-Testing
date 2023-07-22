Feature: Test Find Free Resources Slots for Given Resource Ids Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke
Scenario: Find free resources slots for given resource Ids smoke type test

Given the find_free_resources_slots endpoint 
When I want to find free slots of resources for given entity "healthngo1" with "healthworker" role  for given resource Id "doctor"  with coinciding as "true" 
Then the result should be a date object of From year "2018" and To year "2018" for requested resources 
And response code of smoke test GET request is "200"

@unit @happyregression
Scenario Outline: Find free resources slots for given resource Ids

Given the find_free_resources_slots endpoint
When I want to find free slots of resources for given "<requestor_Entity>"  with "<requestor_Role>"  for a given resource Ids "<resourceIds>"  with coinciding value as "<coinciding>" for a given date range from "<startdate>" to "<enddate>"   
Then the result should be a date object of "<From>" and "<To>" for requested resources
And response code of GET request is "200"


Examples:
  |requestor_Entity| requestor_Role|resourceIds   | coinciding | startdate               |enddate                   | From                | To                   |
  |healthngo1      | admin         | Doctor       |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo2      | healthworker  | Lawyer       |  false     |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo3      | healthworker  | ICU          |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo4      | healthworker  | Lab          |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |


@unit @negativeregression
Scenario Outline: Find free resources slots for given resource Ids

Given the find_free_resources_slots endpoint
When I want to find free slots of resources for given "<requestor_Entity>"  with "<requestor_Role>"  for a given resource Ids "<resourceIds>"  with coinciding value as "<coinciding>" for a given date range from "<startdate>" to "<enddate>" with invalid inputs 
Then the result should not be a date object of "<From>" and "<To>" for requested resources
And response code of negative testing GET request for invalid data is not "200" 


Examples:
  |requestor_Entity| requestor_Role|resourceIds   | coinciding | startdate               |enddate                   | From                | To                   |
  |healthngo1      | healthworker  | Doctor       |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo2      | healthworker  | Nurse        |  false     |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo3      | healthworker  | ICU          |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo4      | healthworker  | Lab          |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |