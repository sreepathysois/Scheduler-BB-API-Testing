Feature: Test Find Free Resources Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke
Scenario: Find free resources slots for given resource Ids smoke type test

Given the find_free_resources endpoint 
When I want to find free slots of resources for given entity "healthngo1" with "healthworker" role to EntityId "Hosp1" for "doctor" category of resources with coinciding as "true" 
Then the result should be a date object of From year "2018" and To year "2018" for requested resources 
And response code of smoke test GET request is "200"

@unit @happyregression
Scenario Outline: Find free resources slots for given resource Ids

Given the find_free_resources endpoint
When I want to find free slots of resources for given "<requestor_Entity>"  with "<requestor_Role>"  to "<EntityId>" for "<category>" of resources with coinciding value as "<coinciding>" for a given date range from "<startdate>" to "<enddate>"   
Then the result should be a date object of "<From>" and "<To>" for requested resources
And response code of GET request is "200"


Examples:
  |requestor_Entity| requestor_Role|EntityId      | coinciding |category     |startdate                |enddate                   | From                | To                   |
  |healthngo1      | healthworker  | Hosp1        |  true      |doctor       |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo2      | healthworker  | Hosp1        |  false     |doctor       |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo3      | healthworker  | Hosp2        |  true      |bed          |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo4      | healthworker  | Hosp3        |  true      |icu          |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |

@unit @negativeregression
Scenario Outline: Find free resources slots for given resource Ids with negative inputs

Given the find_free_resources endpoint
When I want to find free slots of resources for given "<requestor_Entity>"  with "<requestor_Role>"  to "<EntityId>" for "<category>" of resources with coinciding value as "<coinciding>" for a given date range from "<startdate>" to "<enddate>" with invalid inputs  
Then the result should not be a date object of "<From>" and "<To>" for requested resources 
And response code of negative testing GET request for invalid data is not "200"


Examples:
  |requestor_Entity| requestor_Role|EntityId      | coinciding |category     |startdate                |enddate                   | From                | To                   |
  |healthngo1      | admin         | Hosp1        |  true      |doctor       |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo1      | healthworker  | Hosp1        |  true      |lawyer       |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo1      | healthworker  | Hosp1        |  true      |bed          |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |healthngo1      | healthworker  | Hosp3        |  true      |ambulance    |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
