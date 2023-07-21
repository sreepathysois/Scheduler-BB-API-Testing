import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/subscribers/deallocate_subscriber/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/deallocatesubscriber.feature')
 
# Fixtures
 


@pytest.fixture



#@given(parsers.parse('the requestor entity is "healthngo1" with role as "{healthworker}" for a session "{sessionId}" with subscriber_Id "{subscriberId:d}" to deallocate a subscriber'), target_fixture='smoke_delete_request')
@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for a session "{sessionId}" with subscriberId "{subscriberId}" to deallocate a subscriber for smoke testing'), target_fixture='smoke_delete_request')
def smoke_delete_request(requestor_Entity, requestor_Role, sessionId, subscriberId):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'sessionId': sessionId, 'subscriberId': subscriberId}
    response = requests.delete(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for a session "{sessionId}" with subscriberId "{subscriberId}" to deallocate a subscriber'), target_fixture='unit_delete_request')
def unit_delete_request(requestor_Entity, requestor_Role, sessionId, subscriberId):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'sessionId': sessionId, 'subscriberId': subscriberId}
    response = requests.delete(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for a session "{sessionId}" with subscriberId "{subscriberId}" to deallocate a subscriber'), target_fixture='neg_delete_request')
def neg_delete_request(requestor_Entity, requestor_Role, sessionId, subscriberId):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'sessionId': sessionId, 'subscriberId': subscriberId}
    response = requests.delete(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('a Delete request for an endpoint /subscribers/deallocate_subscriber/ is triggered to deallocate subscriber for scheduler block'), target_fixture = 'delete_request')
def delete_request():
    pass


@then(parsers.parse('response code of Delete request is "{code:d}" for smoke testing'))
def smoke_delete_response_code(smoke_delete_request, code):
    assert smoke_delete_request.status_code == code	

@then(parsers.parse('response code of Delete request is "{code:d}"'))
def unit_delete_response_code(unit_delete_request, code):
    assert unit_delete_request.status_code == code	


@then(parsers.parse('response code of negative testing Delete request for invalid data is "{status_code:d}"'))
def neg_delete_response_code(neg_delete_request, status_code):
    assert neg_delete_request.status_code != status_code	
