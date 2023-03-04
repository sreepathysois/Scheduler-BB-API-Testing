Feature: Send Session Alert of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Send Session Alert for Scheduler API Smoke Test   

#Given the requestor entity is "healthngo1" with role as "healthworker" for a sesion with Id "4524453535" and alertId "4524453535"
Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a sesion with Id "<sessionId>" and alertId "<alertId>" for smoke testing 
When a POST request for an endpoint /alert/send_session_alert/ is triggered to Send Session Alert for scheduler block      
Then the result should return sessiontoken as "4524453535" for smoke testing
And response code of POST request is "200" for smoke testing 


Examples: 
  | requestor_Entity | requestor_Role | sessionId | alertId    | sessiontoken |
  | healthngo1       | healthworker   | 4524453535| 4524453535 | 4524453535   |

@unit @happyregression  
Scenario Outline: Send Session Alert for Scheduler API Unit and Regression Happy Testing

Given the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a sesion with Id "<sessionId>" and alertId "<alertId>"
When a POST request for an endpoint /alert/send_session_alert/ is triggered to Send Session Alert for scheduler block
Then the result should return sessiontoken as "<sessiontoken>" for requested entity
And response code of POST request is "200"

Examples: 
  | requestor_Entity | requestor_Role | sessionId | alertId    | sessiontoken |
  | healthngo1       | healthworker   | 4524453535| 4524453535 | 4524453535   |

@unit @Negativeregression  
Scenario Outline: Send Session Alert for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor entity is "<requestor_Entity>" with role as "<requestor_Role>" for a sesion with Id "<sessionId>" and alertId "<alertId>"
When a POST request for an endpoint /alert/send_session_alert/ is triggered to Send Session Alert for scheduler block
Then the result should not return an sessiontoken object "<sessiontoken>" for sension session alert request
And response code of negative testing POST request for invalid data is "<status_code>" 


Examples:
  | requestor_Entity | requestor_Role | sessionId | alertId    | sessiontoken | status_code |
  | healthngo1       | healthworker   | 4524453535| 4524453535 | 4524453535   | 400         |
  | healthngo1       | healthworker   | 4524453535| 4524453535 | 4524453535   | 403         |
  | healthngo1       | healthworker   | 4524453535| 4524453535 | 4524453535   | 404         |
