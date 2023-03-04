import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/entity/affiliate_entity/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/affiliateentity.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" for an entity with entityId "{entityId:d}"'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker,entityId):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker,'entityId':entityId}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for an entity with entityId "{entityId}" with its target Id as "{targetId}" in a category "{targetcategory}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_Entity, requestor_Role, entityId, targetId, targetcategory):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'entityId': entityId, 'targetId': targetId, 'targetcategory': targetcategory}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for an entity with entityId "{entityId}" with its target Id as "{targetId}" in a category "{targetcategory}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_Entity, requestor_Role, entityId, targetId, targetcategory):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'entityId': entityId, 'targetId': targetId, 'targetcategory': targetcategory}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('a POST request for an endpoint /entity/affiliate_entity/ is triggered to affiliate an entity for scheduler block'), target_fixture = 'post_request')
def post_request():
    pass


@then(parsers.parse('response code of POST request is "{code:d}" for smoke testing'))
def smoke_post_response_code(smoke_post_request, code):
    assert smoke_post_request.status_code == code	

@then(parsers.parse('response code of POST request is "{code:d}"'))
def unit_post_response_code(unit_post_request, code):
    assert unit_post_request.status_code == code	


@then(parsers.parse('response code of negative testing post request for invalid data is "{status_code:d}"'))
def neg_post_response_code(neg_post_request, status_code):
    assert neg_post_request.status_code != status_code	
