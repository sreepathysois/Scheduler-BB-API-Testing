Feature: Test Find Free Resources Slots for Given Resource Ids Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke
Scenario: Find free resources slots for given resource Ids smoke type test

Given the find_free_resources_slots endpoint 
When I want to find free slots of resources for given entity "practo" with "admin" role  for given resource Id "doctor"  with coinciding as "true" 
Then the result should be a date object of From year "2018" and To year "2018" for requested resources 
And response code of smoke test GET request is "200"

@unit @regression
Scenario Outline: Find free resources slots for given resource Ids

Given the find_free_resources_slots endpoint
When I want to find free slots of resources for given "<requestor_Entity>"  with "<requestor_Role>"  for a given resource Ids "<resourceIds>"  with coinciding value as "<coinciding>" for a given date range from "<startdate>" to "<enddate>"   
Then the result should be a date object of "<From>" and "<To>" for requested resources
And response code of GET request is "200"


Examples:
  |requestor_Entity| requestor_Role|resourceIds   | coinciding | startdate               |enddate                   | From                | To                   |
  |practo          | admin         | Doctor       |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |practo          | admin         | Nurse        |  false     |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |practo          | admin         | ICU          |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
  |practo          | admin         | Lab          |  true      |2023-02-04T08:44:44.683Z |2023-02-04T08:44:44.683Z  |2018-02-15T00:00:00Z | 2018-02-15T00:00:00Z |
