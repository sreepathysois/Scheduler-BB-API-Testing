import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/session/get_session_details/'
 
# Scenarios
 
scenarios('../features/getsessiondetails.feature')
 
# Fixtures
 


@pytest.fixture
@given(parsers.parse('a endpoint to get existing session details using Update request'), target_fixture='find_free_resources_response')
def find_free_resources_response():
    pass


@when(parsers.parse('the "{healthngo1}" and "{healthworker}" for a existing session ID "{4524458935:d}"'), target_fixture = 'find_free_resources_response_get')
def find_free_resources_response_get(find_free_resources_response, healthngo1, healthworker, session):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'session_id': session}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    #print(EntityId)
    return response
    #assert find_free_resources_response_code.status_code == code
    #return response

@when(parsers.parse('the "{requestor_Entity}" and "{requestor_Role}" for a existing session ID "{SessionID}"'), target_fixture = 'unit_find_free_resources_response_get')
def unit_find_free_resources_response_get(find_free_resources_response, requestor_Entity, requestor_Role, SessionID):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'session_id': SessionID}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    #print(EntityId)
    return response


@when(parsers.parse('the "{requestor_Entity}" and "{requestor_Role}" for a invalid session ID "{SessionID}"'), target_fixture = 'neg_find_free_resources_response_get')
def neg_find_free_resources_response_get(find_free_resources_response, requestor_Entity, requestor_Role, SessionID):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'session_id': SessionID}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    #print(EntityId)
    return response
    #assert find_free_resources_response_code.status_code == code



@then(parsers.parse('response will have details of "{resource_ids}" with "{subscriber_ids}" and date interval from "{startDate}" to "{endDate}"'))
def unit_find_free_resources_response_assert(unit_find_free_resources_response_get, resource_ids, subscriber_ids, startDate, endDate):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = unit_find_free_resources_response_get.json()   
    print(assert_response['resource_ids'])
    assert assert_response['resource_ids']  != 0 
    #assert len(startdate) > 0

@then(parsers.parse('response will not match with of "{resource_ids}" with "{subscriber_ids}" and date interval from "{startDate}" to "{endDate}"'))
def neg_free_resources_response_assert(neg_find_free_resources_response_get, resource_ids, subscriber_ids, startDate, endDate):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = neg_find_free_resources_response_get.json()   
    print(assert_response)
    assert assert_response['resource_ids']  != 0 
    #assert len(startdate) > 0



@then(parsers.parse('response code of get details request is "{code:d}" for smoke testing'))
def find_response_code(unit_find_free_resources_response_get, code):
    assert unit_find_free_resources_response_get.status_code == code

@then(parsers.parse('response code of get details request is "{code:d}"'))
def unit_find_response_code(unit_find_free_resources_response_get, code):
    assert unit_find_free_resources_response_get.status_code == code


@then(parsers.parse('response code of negative get details request is not "{code:d}"'))
def neg_find_response_code(neg_find_free_resources_response_get, code):
    assert neg_find_free_resources_response_get.status_code == code



