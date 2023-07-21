import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/resource/get_resource_list/'
 
# Scenarios
 
scenarios('../features/getresourcelist.feature')
 
# Fixtures
 


@pytest.fixture


@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" having entityId "{he1}"'), target_fixture = 'smoke_get_request')
def smoke_get_request(healthngo1, healthworker,entityId):
    params = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker,'entityId': entityId}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response
    #assert find_free_resources_response_code.status_code == code

@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" having entityId "{entityId}" for resource_id "{resource_id}" of resource category "{resource_category}" with alert mode "{alertMode}"  for a location is "{location}"'), target_fixture = 'unit_get_request')
def unit_get_request(requestor_Entity, requestor_Role, entityId, resource_id, resource_category,alertMode, location ):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'entityId': entityId,'resource_id': resource_id, 'resource_category': resource_category, 'alertMode': alertMode, 'location': location}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response


@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" having entityId "he1" for resource_id "{resource_id}" of resource cateegory "{resource_category}" with alert mode "{alertMode}"  for a location is "{location}" '), target_fixture = 'neg_get_request')
def neg_get_request(requestor_Entity, requestor_Role, entityId, resource_id, resource_category,alertMode, location):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'entityId': entityId,'resource_id': resource_id, 'resource_category': resource_category, 'alertMode': alertMode, 'location': location}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    #print(EntityId)
    return response
	
	
@when(parsers.parse('a GET request for an endpoint /resource/get_resource_list/ is triggered to get list of resource'), target_fixture='get_request')
def get_request():
    pass




@then(parsers.parse('the result should return subscriber details about "{subscruber_id}" and "{subscriber_name}"'))
def unit_get_response_assert(unit_get_request, subscriber_id, subscriber_name):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = unit_get_request.json()   
    #print(assert_response)
    print(assert_response['subscriber_id'])
  
    assert assert_response['subscriber_name'] != 0  



@then(parsers.parse('response code of GET request is "{code:d}" for smoke testing'))
def smoke_get_response_code(smoke_get_request, code):
    assert smoke_get_request.status_code == code

@then(parsers.parse('response code of GET request is "{code:d}"'))
def unit_get_response_code(unit_get_request, code):
    assert unit_get_request.status_code == code



@then(parsers.parse('response code of negative testing GET request for invalid data is "{status_code}"'))
def neg_get_response_code(neg_get_request, status_code):
    assert neg_get_request.status_code == eval(status_code)


