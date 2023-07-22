import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/alert/create_alert/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/createalert.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" to create a new alert'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" to create a new alert with category "{alertcategory}" and message "{alertMessage}" for an entityId "{entityId}" with resource and subscriber Ids are "{resource_ids}" "{subscriber_ids}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_Entity, requestor_Role, alertcategory, alertMessage,entityId, resource_ids, subscriber_ids):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'alertcategory': alertcategory, 'alertMessage': alertMessage, 'entityId': entityId, 'resource_ids': resource_ids, 'subscriber_ids': subscriber_ids}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" to create a new alert with category "{alertcategory}" and message "{alertMessage}" for an entityId "{entityId}" with resource and subscriber Ids are "{resource_ids}" "{subscriber_ids}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_Entity, requestor_Role, alertcategory, alertMessage,entityId, resource_ids, subscriber_ids):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'alertcategory': alertcategory, 'alertMessage': alertMessage, 'entityId': entityId, 'resource_ids': resource_ids, 'subscriber_ids': subscriber_ids}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('a POST request for an endpoint /alert/create_alert/ is triggered to create new alert for scheduler block'), target_fixture = 'post_request')
def post_request():
    pass

@then(parsers.parse('the result should return alertId as "{alertId:d}" for smoke testing'))
def smoke_response_assert(smoke_post_request, alertId):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = smoke_post_request.json()   
    print(assert_response)
    assert eval(assert_response) == alertId

@then(parsers.parse('the result should return alertId as "{alertId}" for requested entity'))
def unit_response_assert(unit_post_request, alertId):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    assert assert_response == alertId

@then(parsers.parse('the result should not return an alertId object "{alertId}" for requested entiyty'))
def neg_response_assert(neg_post_request, alertId):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = neg_post_request.json()   
    print(assert_response)
    assert assert_response != alertId

@then(parsers.parse('response code of POST request is "{code:d}" for smoke testing'))
def smoke_post_response_code(smoke_post_request, code):
    assert smoke_post_request.status_code == code	

@then(parsers.parse('response code of POST request is "{code:d}"'))
def unit_post_response_code(unit_post_request, code):
    assert unit_post_request.status_code == code	


@then(parsers.parse('response code of negative testing POST request for invalid data is "{status_code:d}"'))
def neg_post_response_code(neg_post_request, status_code):
    assert neg_post_request.status_code != status_code	
