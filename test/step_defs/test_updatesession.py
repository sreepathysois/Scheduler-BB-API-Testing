import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/session/update_session/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/updatesession.feature')
 
# Fixtures
 


@pytest.fixture

@given(parsers.parse('a endpoint to update existing session using Update request'), target_fixture = 'update_session_pass')
def update_session_pass():
    pass

@when(parsers.parse('the "{healthngo1}" and "{healthworker}" for a existing session ID "{4524458935:d}"'), target_fixture='update_session')
def update_session(update_session_pass,healthngo1,session):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker, 'session_id' : session}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@when(parsers.parse('session with "{SessionID}" is updated with "{requestor_Entity}" and "{requestor_Role}" for a given date range from "{startDate}" to "{endDate}" with time interval from "{startTime}" to "{endTime}" for an "{activity}" with "{session_name}" with further inputs like "{hostentityId}" with "{subscriber_limit}" and "{session_charges}" in "{currency}" for a specific "{terms_conditions}" with following "{instructions}"'), target_fixture='unit_update_session')
def unit_update_session(update_session_pass,requestor_Entity, requestor_Role, SessionID,startDate, endDate, startTime, endTime, activity, session_name, hostentityId, subscriber_limit, session_charges, currency, terms_conditions, instructions):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'session_id': SessionID,'startDate': startDate, 'endDate': endDate, 'startTime': startTime, 'endTime': endTime, 'activity': activity, 'session_name' : session_name, 'hostentityId' : hostentityId, 'subscriber_limit' : subscriber_limit, 'session_charges' : session_charges, 'currency': currency, 'terms_conditions': terms_conditions, 'instructins': instructions}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@when(parsers.parse('session with "{SessionID}" is updated with invalid inputs for "{requestor_Entity}" and "{requestor_Role}" for a given date range from "{startDate}" to "{endDate}" with time interval from "{startTime}" to "{endTime}" for an "{activity}" with "{session_name}" with further inputs like "{hostentityId}" with "{subscriber_limit}" and "{session_charges}" in "{currency}" for a specific "{terms_conditions}" with following "{instructions}"'), target_fixture='neg_update_session')
def neg_update_session(update_session_pass,requestor_Entity, requestor_Role, SessionID,startDate, endDate, startTime, endTime, activity, session_name, hostentityId, subscriber_limit, session_charges, currency, terms_conditions, instructions):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'session_id': SessionID,'startDate': startDate, 'endDate': endDate, 'startTime': startTime, 'endTime': endTime, 'activity': activity, 'session_name' : session_name, 'hostentityId' : hostentityId, 'subscriber_limit' : subscriber_limit, 'session_charges' : session_charges, 'currency': currency, 'terms_conditions': terms_conditions, 'instructins': instructions}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response




@then(parsers.parse('response code of Update request is "{code:d}" for smoke testing'))
def session_status_code(update_session, code):
    assert update_session.status_code == code	

@then(parsers.parse('response code of Update request is "{code:d}"'))
def session_status_code(unit_update_session, code):
    assert unit_update_session.status_code == code	


@then(parsers.parse('response code of negative Update request is not "{code:d}"'))
def session_status_code(neg_update_session, code):
    assert neg_update_session.status_code == code	
