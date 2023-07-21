import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/find_free_resource_slots/'
 
# Scenarios
 
scenarios('../features/getfindfreeresourceslots.feature')
 
# Fixtures
 


@pytest.fixture


@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" to find free resources slots for given resourceIds "{doctor}" with coinciding as "{true}"'), target_fixture = 'smoke_get_request')
def smoke_get_request(healthngo1, healthworker,doctor,true):
    params = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker,'resourceIds': doctor, 'coinciding': true}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response
    #assert find_free_resources_response_code.status_code == code

@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" to find free resources slots for a given resourceIds "{resourceIds}"  with coinciding value as "{coinciding}" for a given date range from "{startdate}" to "{enddate}"'), target_fixture = 'unit_get_request')
def unit_get_request(requestor_Entity, requestor_Role, resourceIds, coinciding):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'resourceIds': resourceIds, 'coinciding': coinciding}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response


@given(parsers.parse('the invalid inputs for the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" to find free resources slots for a given resourceIds "{resourceIds}"  with coinciding value as "{coinciding}" for a given date range from "{startdate}" to "{enddate}"'), target_fixture = 'neg_get_request')
def neg_get_request(requestor_Entity, requestor_Role, resourceIds, coinciding):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'resourceIds': resourceIds, 'coinciding': coinciding}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    #print(EntityId)
    return response
	
	
@when(parsers.parse('a GET request for an endpoint /find_free_resource_slots/ is triggered to get/find slots of free resources'), target_fixture='get_request')
def get_request():
    pass




@then(parsers.parse('the result should be a date object of "{From}" and "{To}" for requested resources slots'))
def unit_get_response_assert(unit_get_request, From, To):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = unit_get_request.json()   
    for date in assert_response: 
        print (date) 
         
    startdate = assert_response[0]['from'] 
    print(startdate)
    enddate = assert_response[0]['to'] 
    print(type(From))
    #From_time = datetime.datetime.strptime(str(From), '%Y-%m-%dT%H:%M:%S.%fZ') 
    print(From)
    assert startdate == From  
    assert enddate == To   



@then(parsers.parse('response code of GET request is "{code:d}" for smoke testing'))
def smoke_get_response_code(smoke_get_request, code):
    assert smoke_get_request.status_code == code

@then(parsers.parse('response code of GET request is "{code:d}"'))
def unit_get_response_code(unit_get_request, code):
    assert unit_get_request.status_code == code



@then(parsers.parse('response code of negative testing GET request for invalid data is "{status_code}"'))
def neg_get_response_code(neg_get_request, status_code):
    assert neg_get_request.status_code != eval(status_code)


