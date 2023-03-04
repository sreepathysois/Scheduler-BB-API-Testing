import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/alert/allocate_alert/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/allocatealert.feature')
 
# Fixtures
 


@pytest.fixture



#@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" for a session with sessionId "{sessionId:d}" and alertId "{alertId:d}"'), target_fixture='smoke_post_request')
@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for a session with sessionId "{sessionId}" and alertId "{alertId}" for smoke testing'), target_fixture='smoke_post_request')
def smoke_post_request(requestor_Entity, requestor_Role, sessionId, alertId):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'sessionId':sessionId,'alertId': alertId}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for a session with sessionId "{sessionId}" and alertId "{alertId}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_Entity, requestor_Role, sessionId, alertId):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'sessionId':sessionId,'alertId': alertId}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

#@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for a session with sessionId "{sessionId}'), target_fixture='neg_post_request')
@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for a session with sessionId "{sessionId}" and alertId "{alertId}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_Entity, requestor_Role, sessionId, alertId):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'sessionId':sessionId,'alertId': alertId}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('a POST request for an endpoint /alert/allocate_alert/ is triggered to allocate an alert to a session for scheduler block'), target_fixture = 'post_request')
def post_request():
    pass


@then(parsers.parse('response code of POST request is "{code:d}" for smoke testing'))
def smoke_post_response_code(smoke_post_request, code):
    assert smoke_post_request.status_code == code	

@then(parsers.parse('response code of POST request is "{code:d}"'))
def unit_post_response_code(unit_post_request, code):
    assert unit_post_request.status_code == code	


@then(parsers.parse('response code of negative testing post request for invalid data is "{status_code:d}"'))
def neg_post_response_code(neg_post_request, status_code):
    assert neg_post_request.status_code != status_code	
