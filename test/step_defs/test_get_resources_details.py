import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/resources/get_resource_details/'
 
# Scenarios
 
scenarios('../features/getresourcesdetails.feature')
 
# Fixtures
 


@pytest.fixture


@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" for a resource_id "{resource_id:d}"'), target_fixture = 'smoke_get_request')
def smoke_get_request(healthngo1, healthworker,resource_id):
    params = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker,'resource_id': resource_id}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response
    #assert find_free_resources_response_code.status_code == code

@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for resource_id "{resource_id}"'), target_fixture = 'unit_get_request')
def unit_get_request(requestor_Entity, requestor_Role, resource_id):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'resource_id': resource_id}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response


@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for resource_id "{resource_id}"'), target_fixture = 'neg_get_request')
def neg_get_request(requestor_Entity, requestor_Role, resource_id):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'resource_id': resource_id}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    #print(EntityId)
    return response
	
	
@when(parsers.parse('a GET request for an endpoint /resources/get_resource_details/ is triggered to get details of resource'), target_fixture='get_request')
def get_request():
    pass




@then(parsers.parse('the result should return following details of resources with following details like "{resource_category}" "{name}" "{phone_no}" "{email_id}" for alert url "{alert_url}" with alert mode "{alertMode}" for an entity "{entityId}" for a location is "{location}"'))
def unit_get_response_assert(unit_get_request, resource_category, name, phone_no, email_id, alert_url, alertMode, entityId, location):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = unit_get_request.json()   
    #print(assert_response)
    print(assert_response['resource_category'])
  
    assert assert_response['name'] != 0  



@then(parsers.parse('response code of GET request is "{code:d}" for smoke testing'))
def smoke_get_response_code(smoke_get_request, code):
    assert smoke_get_request.status_code == code

@then(parsers.parse('response code of GET request is "{code:d}"'))
def unit_get_response_code(unit_get_request, code):
    assert unit_get_request.status_code == code



@then(parsers.parse('response code of negative testing GET request for invalid data is "{status_code}"'))
def neg_get_response_code(neg_get_request, status_code):
    assert neg_get_request.status_code == eval(status_code)


