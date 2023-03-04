import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/entity/create_entity/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/createentity.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" to create a new entity'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" to create a entity with name "{entityname}" with following details like "{phone_no}" "{email_id}" with home page url "{url}" for a specified "{location}" with its category as "{entitycategory}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_Entity, requestor_Role, entityname, phone_no, email_id, url, location, entitycategory):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'entityname': entityname, 'phone_no': phone_no, 'email_id': email_id, 'url': url, 'location' : location, 'entitycategory': entitycategory}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" to create a entity with name "{entityname}" with following details like "{phone_no}" "{email_id}" with home page url "{url}" for a specified "{location}" with its category as "{entitycategory}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_Entity, requestor_Role, entityname, phone_no, email_id, url, location, entitycategory):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'entityname': entityname, 'phone_no': phone_no, 'email_id': email_id, 'url': url, 'location' : location, 'entitycategory': entitycategory}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('a POST request for an endpoint /entity/create_entity/ is triggered to create new entity for scheduler block'), target_fixture = 'post_request')
def post_request():
    pass

@then(parsers.parse('the result should return entity Id as "{entity_id:d}" for smoke testing'))
def smoke_response_assert(smoke_post_request, entity_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = smoke_post_request.json()   
    print(assert_response)
    assert eval(assert_response) == entity_id

@then(parsers.parse('the result should return entity id as "{entity_id}" for requested entity'))
def unit_response_assert(unit_post_request, entity_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    assert assert_response == entity_id

@then(parsers.parse('the result should not return a entity Id object "{entity_id}" for requested entiyty'))
def neg_response_assert(neg_post_request, entity_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = neg_post_request.json()   
    print(assert_response)
    assert assert_response != entity_id

@then(parsers.parse('response code of POST request is "{code:d}" for smoke testing'))
def smoke_post_response_code(smoke_post_request, code):
    assert smoke_post_request.status_code == code	

@then(parsers.parse('response code of POST request is "{code:d}"'))
def unit_post_response_code(unit_post_request, code):
    assert unit_post_request.status_code == code	


@then(parsers.parse('response code of negative testing POST request for invalid data is "{status_code:d}"'))
def neg_post_response_code(neg_post_request, status_code):
    assert neg_post_request.status_code != status_code	
