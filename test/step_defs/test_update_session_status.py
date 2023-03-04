import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/session/update_session_Status/'
#API_HOME = 'http://myapi:3000/subscribers/create_session/'
 
# Scenarios
 
scenarios('../features/updatesessionstatus.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" to update an session status for source_BB_Id "{source_BB_Id}" with sessiontoken "{sessiontoken:d}" and status as "{success}" for smoke testing'), target_fixture='smoke_put_request')
def smoke_put_request(healthngo1,healthworker,source_BB_Id, sessiontoken, status):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker,'source_BB_Id':source_BB_Id, 'sessiontoken': sessiontoken, 'status': status}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" to update an session status for source_BB_Id "{source_BB_Id}" with sessiontoken "{sessiontoken}" and status as "{status}"'), target_fixture='unit_put_request')
def unit_put_request(requestor_Entity, requestor_Role,source_BB_Id, sessiontoken, status):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'source_BB_Id': source_BB_Id,'sessiontoken' : sessiontoken, 'status': status}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" to update an session status for source_BB_Id "{source_BB_Id}" with sessiontoken "{sessiontoken}" and status as "{status}"'), target_fixture='neg_put_request')
def neg_put_request(requestor_Entity, requestor_Role,source_BB_Id, sessiontoken, status):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'source_BB_Id': source_BB_Id,'sessiontoken' : sessiontoken, 'status': status}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('an Update request for an endpoint /session/update_session_Status/ is triggered to update session status for scheduler block'), target_fixture = 'post_request')
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
