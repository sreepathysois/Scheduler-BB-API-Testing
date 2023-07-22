import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/session/update_session/'
#API_HOME = 'http://myapi:3000/subscribers/create_session/'
 
# Scenarios
 
scenarios('../features/updatesession.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" to update an session with its ID "{session_id:d}"'), target_fixture='smoke_put_request')
def smoke_put_request(healthngo1,healthworker,session_id):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker,'session_id':session_id}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" to update a session with its ID "{session_id}" for a given date range from "{startDate}" to "{endDate}" with time interval from "{startTime}" to "{endTime}" for an "{activity}" with "{session_name}" with further inputs like "{hostentityId}" with "{subscriber_limit}" and "{session_charges}" in "{currency}" for a specific "{terms_conditions}" with following "{instructions}"'), target_fixture='unit_put_request')
def unit_put_request(requestor_Entity, requestor_Role,session_id,startDate, endDate, startTime, endTime,activity, session_name,hostentityId, subscriber_limit, session_charges,currency, terms_conditions, instructions):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'session_id': session_id,'startDate': startDate, 'endDate': endDate,'startTime':startTime,'endTime': endTime, 'activity': activity, 'session_name': session_name, 'hostentityId' :hostentityId,'subscriber_limit': subscriber_limit, 'session_charges': session_charges,'currency': currency, 'terms_conditions': terms_conditions, 'instructions': instructions}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" to update a session with its ID "{session_id}" for a given date range from "{startDate}" to "{endDate}" with time interval from "{startTime}" to "{endTime}" for an "{activity}" with "{session_name}" with further inputs like "{hostentityId}" with "{subscriber_limit}" and "{session_charges}" in "{currency}" for a specific "{terms_conditions}" with following "{instructions}"'), target_fixture='neg_put_request')
def neg_put_request(requestor_Entity, requestor_Role,session_id,startDate, endDate, startTime, endTime,activity, session_name,hostentityId, subscriber_limit, session_charges,currency, terms_conditions, instructions):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'session_id': session_id,'startDate': startDate, 'endDate': endDate,'startTime':startTime,'endTime': endTime, 'activity': activity, 'session_name': session_name, 'hostentityId' :hostentityId,'subscriber_limit': subscriber_limit, 'session_charges': session_charges,'currency': currency, 'terms_conditions': terms_conditions, 'instructions': instructions}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('an Update request for an endpoint /session/update_session/ is triggered to update existing session for scheduler block'), target_fixture = 'post_request')
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
