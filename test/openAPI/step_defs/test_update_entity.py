import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/entity/update_entity/'
#API_HOME = 'http://myapi:3000/subscribers/create_session/'
 
# Scenarios
 
scenarios('../features/updateentity.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" to update an entity with its ID "{entity_id:d}"'), target_fixture='smoke_put_request')
def smoke_put_request(healthngo1,healthworker,entity_id):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker,'entity_id':entity_id}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for an entity with Id "{entity_id}" to update an entity with name "{entityname}" with following details like "{phone_no}" "{email_id}" with home page url "{url}" for a specified "{location}" with its category as "{entitycategory}"'), target_fixture='unit_put_request')
def unit_put_request(requestor_Entity, requestor_Role,entity_id, entityname, phone_no, email_id, url,location,entitycategory):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'entity_id':entity_id,'entityname': entityname, 'phone_no': phone_no, 'email_id': email_id, 'url': url,'location' : location, 'entitycategory': entitycategory}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for an entity with Id "{entity_id}" to update an entity with name "{entityname}" with following details like "{phone_no}" "{email_id}" with home page url "{url}" for a specified "{location}" with its category as "{entitycategory}"'), target_fixture='neg_put_request')
def neg_put_request(requestor_Entity, requestor_Role,entity_id, entityname, phone_no, email_id, url,location,entitycategory):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'entity_id':entity_id,'entityname': entityname, 'phone_no': phone_no, 'email_id': email_id, 'url': url,'location' : location, 'entitycategory': entitycategory}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('an Update request for an endpoint /entity/update_entity/ is triggered to update existing entity for scheduler block'), target_fixture = 'post_request')
def put_request():
    pass


@then(parsers.parse('response code of Update request is "{code:d}" for smoke testing'))
def smoke_put_response_code(smoke_put_request, code):
    assert smoke_put_request.status_code == code	

@then(parsers.parse('response code of Update request is "{code:d}"'))
def unit_put_response_code(unit_put_request, code):
    assert unit_put_request.status_code == code	


@then(parsers.parse('response code of negative testing an Update request for invalid data is "{status_code}"'))
def neg_put_response_code(neg_put_request, status_code):
    assert neg_put_request.status_code != eval(status_code)
