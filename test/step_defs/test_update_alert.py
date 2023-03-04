import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/alert/update_alert/'
#API_HOME = 'http://myapi:3000/subscribers/create_session/'
 
# Scenarios
 
scenarios('../features/updatealert.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" to update an existing alert with its ID "{alertId:d}"'), target_fixture='smoke_put_request')
def smoke_put_request(healthngo1,healthworker,alertId):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker,'alertId':alertId}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for an existing alert with Id "{alertId}" to update an alert category "{alertcategory}" and message "{alertMessage}" for an entityId "{entityId}" with resource and subscriber Ids are "{resource_ids}" "{subscriber_ids}"'), target_fixture='unit_put_request')
def unit_put_request(requestor_Entity, requestor_Role,alertId,alertcategory,alertMessage,entityId,resource_ids, subscriber_ids):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'alertId': alertId, 'alertcategory': alertcategory, 'alertMessage': alertMessage, 'entityId': entityId, 'resource_ids': resource_ids, 'subscriber_ids': subscriber_ids}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for an existing alert with Id "{alertId}" to update an alert category "{alertcategory}" and message "{alertMessage}" for an entityId "{entityId}" with resource and subscriber Ids are "{resource_ids}" "{subscriber_ids}"'), target_fixture='neg_put_request')
def neg_put_request(requestor_Entity, requestor_Role,alertId,alertcategory,alertMessage,entityId,resource_ids, subscriber_ids):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'alertId': alertId, 'alertcategory': alertcategory, 'alertMessage': alertMessage, 'entityId': entityId, 'resource_ids': resource_ids, 'subscriber_ids': subscriber_ids}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('an Update request for an endpoint /alert/update_alert/ is triggered to update an existing alert for scheduler block'), target_fixture = 'post_request')
def put_request():
    pass


@then(parsers.parse('response code of Update request is "{code:d}" for smoke testing'))
def smoke_put_response_code(smoke_put_request, code):
    assert smoke_put_request.status_code == code	

@then(parsers.parse('response code of Update request is "{code:d}"'))
def unit_put_response_code(unit_put_request, code):
    assert unit_put_request.status_code == code	


@then(parsers.parse('response code of negative testing an Update request for invalid data is "{status_code}"'))
def neg_put_response_code(neg_put_request, status_code):
    assert neg_put_request.status_code != eval(status_code)
