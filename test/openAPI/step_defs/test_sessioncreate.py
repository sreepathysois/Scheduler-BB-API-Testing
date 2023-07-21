import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/session/create_session/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/sessioncreate.feature')
 
# Fixtures
 


@pytest.fixture

@given(parsers.parse('a endpoint to create new session using POST request'), target_fixture = 'create_session_pass')
def create_session_pass():
    pass

@when(parsers.parse('the "{healthngo1}" and "{healthworker}" for a given date range from "{start}" to "{end}"'), target_fixture='create_session')
def create_session(create_session_pass,healthngo1,healthworker, start, end):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker, 'startDate': start, 'endDate': end}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@when(parsers.parse('the "{requestor_Entity}" and "{requestor_Role}" for a given date range from "{startDate}" to "{endDate}" with time interval from "{startTime}" to "{endTime}" for an "{activity}" with "{session_name}" with further inputs like "{hostentityId}" with "{subscriber_limit}" and "{session_charges}" in "{currency}" for a specific "{terms_conditions}" with following "{instructions}"'), target_fixture='unit_create_session')
def unit_create_session(create_session_pass,requestor_Entity, requestor_Role, startDate, endDate, startTime, endTime, activity, session_name, hostentityId, subscriber_limit, session_charges, currency, terms_conditions, instructions):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'startDate': startDate, 'endDate': endDate, 'startTime': startTime, 'endTime': endTime, 'activity': activity, 'session_name' : session_name, 'hostentityId' : hostentityId, 'subscriber_limit' : subscriber_limit, 'session_charges' : session_charges, 'currency': currency, 'terms_conditions': terms_conditions, 'instructins': instructions}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@when(parsers.parse('the invalid inputs for "{requestor_Entity}" and "{requestor_Role}" for a given date range from "{startDate}" to "{endDate}" with time interval from "{startTime}" to "{endTime}" for an "{activity}" with "{session_name}" with further inputs like "{hostentityId}" with "{subscriber_limit}" and "{session_charges}" in "{currency}" for a specific "{terms_conditions}" with following "{instructions}"'), target_fixture='neg_create_session')
def neg_create_session(create_session_pass,requestor_Entity, requestor_Role, startDate, endDate, startTime, endTime, activity, session_name, hostentityId, subscriber_limit, session_charges, currency, terms_conditions, instructions):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'startDate': startDate, 'endDate': endDate, 'startTime': startTime, 'endTime': endTime, 'activity': activity, 'session_name' : session_name, 'hostentityId' : hostentityId, 'subscriber_limit' : subscriber_limit, 'session_charges' : session_charges, 'currency': currency, 'terms_conditions': terms_conditions, 'instructins': instructions}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response



@then(parsers.parse('the result should be a SessionID object "{sessionID:d}" for requested resources for smoke testing'))
def session_id_assert(create_session, sessionID):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = create_session.json()   
    print(assert_response)
    assert eval(assert_response) == sessionID

@then(parsers.parse('the result should be a SessionID object "{SessionID}" for requested resources'))
def session_id_assert(unit_create_session, SessionID):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_create_session.json()   
    print(assert_response)
    assert assert_response == SessionID

@then(parsers.parse('the result should not return a SessionID object "{SessionID}" for requested resources'))
def session_id_assert(neg_create_session, SessionID):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = neg_create_session.json()   
    print(assert_response)
    assert assert_response == SessionID

@then(parsers.parse('response code of POST request is "{code:d}" for smoke testing'))
def session_status_code(create_session, code):
    assert create_session.status_code == code	

@then(parsers.parse('response code of POST request is "{code:d}"'))
def session_status_code(unit_create_session, code):
    assert unit_create_session.status_code == code	


@then(parsers.parse('response code of negative testing POST request for invalid data is not "{code:d}"'))
def session_status_code(neg_create_session, code):
    assert neg_create_session.status_code == code	
