import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/find_free_resource_slots/'
 
# Scenarios
 
scenarios('../features/findfreeresourceslotsapi.feature')
 
# Fixtures
 


@pytest.fixture
@given(parsers.parse('the find_free_resources_slots endpoint'), target_fixture='find_free_resources_response')
def find_free_resources_response():
    pass


@when(parsers.parse('I want to find free slots of resources for given "{requestor_Entity}"  with "{requestor_Role}"  for a given resource Ids "{resourceIds}"  with coinciding value as "{coinciding}" for a given date range from "{startdate}" to "{enddate}"'), target_fixture = 'find_free_resources_response_get')
def find_free_resources_response_get(find_free_resources_response, requestor_Entity, requestor_Role, resourceIds, coinciding, startdate, enddate):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'resourceIds': resourceIds, 'coinciding': coinciding, 'stardate': startdate, 'enddate': enddate}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    #print(EntityId)
    return response
    #assert find_free_resources_response_code.status_code == code
    #return response

@when(parsers.parse('I want to find free slots of resources for given "{requestor_Entity}"  with "{requestor_Role}"  for a given resource Ids "{resourceIds}"  with coinciding value as "{coinciding}" for a given date range from "{startdate}" to "{enddate}" with invalid inputs'), target_fixture = 'neg_find_free_resources_response_get')
def neg_find_free_resources_response_get(find_free_resources_response, requestor_Entity, requestor_Role, resourceIds, coinciding, startdate, enddate):
    params = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role,'resourceIds': resourceIds, 'coinciding': coinciding, 'stardate': startdate, 'enddate': enddate}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    #print(EntityId)
    return response


@when(parsers.parse('I want to find free slots of resources for given entity "{practo}" with "{admin}" role  for given resource Id "{doctor}"  with coinciding as "{true}"'), target_fixture = 'smoke_find_free_resources_response_get')
def smoke_find_free_resources_response_get(find_free_resources_response, practo, admin, doctor,true):
    params = {'requestor_Entity': practo, 'requestor_Role': admin, 'resourceIds': doctor, 'coinciding': true}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    #print(EntityId)
    return response
    #assert find_free_resources_response_code.status_code == code


@then(parsers.parse('the result should be a date object of "{From}" and "{To}" for requested resources'), converters={'From': str , 'To': str})
def find_free_resources_response_assert(find_free_resources_response_get, From, To):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = find_free_resources_response_get.json()   
    print(assert_response)
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
    #assert len(startdate) > 0
    #assert  From in startdate 
    #assert  To in enddate 
    #assert enddate == eval(To) 
    #print(date)
    #assert json_data['results'][1] == '095be615-a8ad-4c33-8e9c-c7612fbf6c9f' 
    #assert json_data['count'] == 123  

@then(parsers.parse('the result should not be a date object of "{From}" and "{To}" for requested resources'), converters={'From': str , 'To': str})
def neg_find_free_resources_response_assert(neg_find_free_resources_response_get, From, To):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = neg_find_free_resources_response_get.json()   
    print(assert_response)
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
    #assert len(startdate) > 0

@then(parsers.parse('the result should be a date object of "{From}" and "{To}" for requested resources'), converters={'From': str , 'To': str})
def find_free_resources_response_assert(find_free_resources_response_get, From, To):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = find_free_resources_response_get.json()   
    print(assert_response)
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
    #assert len(startdate) > 0


@then(parsers.parse('the result should be a date object of From year "{From:d}" and To year "{To:d}" for requested resources'), converters={'From': str , 'To': str})
def smoke_find_free_resources_response_assert(smoke_find_free_resources_response_get, From, To):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = smoke_find_free_resources_response_get.json()   
    print(assert_response)
    for date in assert_response: 
        print (date) 
         
    startdate = assert_response[0]['from'] 
    print(startdate)
    enddate = assert_response[0]['to'] 
    print(type(From))
    #From_time = datetime.datetime.strptime(str(From), '%Y-%m-%dT%H:%M:%S.%fZ') 
    print(From)
    updated_startdate=startdate.split('-')[0]
    updated_enddate=enddate.split('-')[0]
    assert updated_startdate == From  
    assert updated_enddate == To   


@then(parsers.parse('response code of GET request is "{code:d}"'))
def find_response_code(find_free_resources_response_get, code):
    assert find_free_resources_response_get.status_code == code

@then(parsers.parse('response code of negative testing GET request for invalid data is not "{code:d}"'))
def find_response_code(neg_find_free_resources_response_get, code):
    assert neg_find_free_resources_response_get.status_code == code


@then(parsers.parse('response code of smoke test GET request is "{code:d}"'))
def smoke_find_response_code(smoke_find_free_resources_response_get, code):
    assert smoke_find_free_resources_response_get.status_code == code



