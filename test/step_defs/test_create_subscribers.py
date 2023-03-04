import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/subscribers/create_subscriber/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/createsubscribers.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" to create a new subscriber'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for subscriber category "{subscriber_category}" with following details like "{name}" "{phone_no}" "{email_id}" for alert url "{alert_url}" with alert mode "{alertMode}" for an entity "{entityId}" for a specified "{location}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_Entity, requestor_Role, subscriber_category, name, phone_no, email_id, alert_url, alertMode, entityId, location):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'subscriber_category': subscriber_category, 'name': name, 'phone_no': phone_no, 'email_id': email_id, 'alert_url': alert_url, 'alertMode' : alertMode, 'entityId' : entityId, 'location' : location}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for subscriber category "{subscriber_category}" with following details like "{name}" "{phone_no}" "{email_id}" for alert url "{alert_url}" with alert mode "{alertMode}" for an entity "{entityId}" for a specified "{location}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_Entity, requestor_Role, subscriber_category, name, phone_no, email_id, alert_url, alertMode, entityId, location):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'subscriber_category': subscriber_category, 'name': name, 'phone_no': phone_no, 'email_id': email_id, 'alert_url': alert_url, 'alertMode' : alertMode, 'entityId' : entityId, 'location' : location}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('a POST request for an endpoint /subscribers/create_subscriber/ is triggered to create new subscriber for scheduler block'), target_fixture = 'post_request')
def post_request():
    pass

@then(parsers.parse('the result should return resource id as "{Subscriber_ID:d}" for smoke testing'))
def smoke_response_assert(smoke_post_request, Subscriber_ID):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = smoke_post_request.json()   
    print(assert_response)
    assert eval(assert_response) == Subscriber_ID

@then(parsers.parse('the result should return resource id as "{subscriber_id}" for requested resources'))
def unit_response_assert(unit_post_request, subscriber_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    assert assert_response == subscriber_id

@then(parsers.parse('the result should not return a SubscriberID object "{subscriber_id}" for requested resources'))
def neg_response_assert(neg_post_request, subscriber_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = neg_post_request.json()   
    print(assert_response)
    assert assert_response == subscriber_id

@then(parsers.parse('response code of POST request is "{code:d}" for smoke testing'))
def smoke_post_response_code(smoke_post_request, code):
    assert smoke_post_request.status_code == code	

@then(parsers.parse('response code of POST request is "{code:d}"'))
def unit_post_response_code(unit_post_request, code):
    assert unit_post_request.status_code == code	


@then(parsers.parse('response code of negative testing POST request for invalid data is "{status_code:d}"'))
def neg_post_response_code(neg_post_request, status_code):
    assert neg_post_request.status_code != status_code	
