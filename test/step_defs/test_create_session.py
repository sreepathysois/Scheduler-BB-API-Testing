import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/session/create_session/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/createsession.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the "{healthngo1}" and "{healthworker}" to create a new session'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker ):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the "{requestor_Entity}" and "{requestor_Role}" for a given date range from "{startDate}" to "{endDate}" with time interval from "{startTime}" to "{endTime}" for an "{activity}" with "{session_name}" with further inputs like "{hostentityId}" with "{subscriber_limit}" and "{session_charges}" in "{currency}" for a specific "{terms_conditions}" with following "{instructions}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_Entity, requestor_Role,startDate, endDate, startTime, endTime,activity, session_name,hostentityId, subscriber_limit, session_charges,currency, terms_conditions, instructions ):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'startDate': startDate, 'endDate': endDate,'startTime':startTime,'endTime': endTime, 'activity': activity, 'session_name': session_name, 'hostentityId' :hostentityId,'subscriber_limit': subscriber_limit, 'session_charges': session_charges,'currency': currency, 'terms_conditions': terms_conditions, 'instructions': instructions }
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the "{requestor_Entity}" and "{requestor_Role}" for a given date range from "{startDate}" to "{endDate}" with time interval from "{startTime}" to "{endTime}" for an "{activity}" with "{session_name}" with further inputs like "{hostentityId}" with "{subscriber_limit}" and "{session_charges}" in "{currency}" for a specific "{terms_conditions}" with following "{instructions}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_Entity, requestor_Role,startDate, endDate, startTime, endTime,activity, session_name,hostentityId, subscriber_limit, session_charges,currency, terms_conditions, instructions):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'startDate': startDate, 'endDate': endDate,'startTime':startTime,'endTime': endTime, 'activity': activity, 'session_name': session_name, 'hostentityId' :hostentityId,'subscriber_limit': subscriber_limit, 'session_charges': session_charges,'currency': currency, 'terms_conditions': terms_conditions, 'instructions': instructions}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('a POST request for an endpoint /session/create_session/ is triggered to create new session for scheduler block'), target_fixture = 'post_request')
def post_request():
    pass

@then(parsers.parse('the result should be a SessionID object "{SessionId:d}" of requested session for smoke testing'))
def smoke_response_assert(smoke_post_request, SessionId):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = smoke_post_request.json()   
    print(assert_response)
    assert eval(assert_response) == SessionId

@then(parsers.parse('the result should be a SessionID object "{SessionID}" for requested session'))
def unit_response_assert(unit_post_request, SessionID):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    assert assert_response == SessionID

@then(parsers.parse('the result should not return a SessionID object "{SessionID}" for requested session'))
def neg_response_assert(neg_post_request, SessionID):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = neg_post_request.json()   
    print(assert_response)
    assert assert_response == SessionID

@then(parsers.parse('response code of POST request is "{code:d}" for smoke testing'))
def smoke_post_response_code(smoke_post_request, code):
    assert smoke_post_request.status_code == code	

@then(parsers.parse('response code of POST request is "{code:d}"'))
def unit_post_response_code(unit_post_request, code):
    assert unit_post_request.status_code == code	


@then(parsers.parse('response code of negative testing POST request for invalid data is "{status_code:d}"'))
def neg_post_response_code(neg_post_request, status_code):
    assert neg_post_request.status_code != status_code	
