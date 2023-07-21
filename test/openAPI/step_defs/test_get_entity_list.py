import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/entity/get_entity_list/'
 
# Scenarios
 
scenarios('../features/getentitylist.feature')
 
# Fixtures
 


@pytest.fixture


#@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" for an entity_id "{entity_id:d}"'), target_fixture = 'smoke_get_request')
@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for an entity with Id as "{entityId}"'),target_fixture = 'smoke_get_request')
def smoke_get_request(requestor_Entity, requestor_Role, entityId ):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'entity_id': entity_id}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response
    #assert find_free_subscribers_response_code.status_code == code

@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for an entity with Id as "{entityId}", name as "{entityname}" and with following details like "{phone_no}" "{email_id}" with home page url "{url}" for a specified "{location}" with its category as "{entitycategory}"'), target_fixture = 'unit_get_request')
def unit_get_request(requestor_Entity, requestor_Role, entityId, entityname, phone_no, email_id, url, location, entitycategory):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'entityId': entityId, 'entityname': entityname, 'phone_no': phone_no, 'email_id': email_id, 'url': url, 'location': location, 'entitycategory': entitycategory}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response


@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for an entity with Id as "{entityId}", name as "{entityname}" and with following details like "{phone_no}" "{email_id}" with home page url "{url}" for a specified "{location}" with its category as "{entitycategory}"'), target_fixture = 'neg_get_request')
def neg_get_request(requestor_Entity, requestor_Role, entityId, entityname, phone_no, email_id, url, location, entitycategory):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'entityId': entityId, 'entityname': entityname, 'phone_no': phone_no, 'email_id': email_id, 'url': url, 'location': location, 'entitycategory': entitycategory}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    #print(EntityId)
    return response
	
	
@when(parsers.parse('a GET request for an endpoint /entity/get_entity_list/ is triggered to get list of an entities'), target_fixture='get_request')
def get_request():
    pass




@then(parsers.parse('the result should return entity details about "{entity_id}" and "{entity_name}"'))
def unit_get_response_assert(unit_get_request, entity_id, entity_name):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = unit_get_request.json()   
    #print(assert_response)
    print(assert_response['entitycategory'])
  
    assert assert_response['entityname'] != 0  



@then(parsers.parse('response code of GET request is "{code:d}" for smoke testing'))
def smoke_get_response_code(smoke_get_request, code):
    assert smoke_get_request.status_code == code

@then(parsers.parse('response code of GET request is "{code:d}"'))
def unit_get_response_code(unit_get_request, code):
    assert unit_get_request.status_code == code



@then(parsers.parse('response code of negative testing GET request for invalid data is "{status_code}"'))
def neg_get_response_code(neg_get_request, status_code):
    assert neg_get_request.status_code != eval(status_code)


