import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/subscribers/update_subscriber/'
#API_HOME = 'http://myapi:3000/subscribers/create_session/'
 
# Scenarios
 
scenarios('../features/updatesubscribers.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor entity is "{healthngo1}" with role as "{healthworker}" to update  a subscriber with its id "{subscriber_id:d}"'), target_fixture='smoke_put_request')
def smoke_put_request(healthngo1,healthworker,subscriber_id):
    data = {'requestor_Entity': healthngo1, 'requestor_Role': healthworker,'subscriber_id':subscriber_id}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for a subscriber with Id "{subscriber_id}" to update details for subscriber category "{subscriber_category}" with following details like "{name}" "{phone_no}" "{email_id}" for alert url "{alert_url}" with alert mode "{alertMode}" for an entity "{entityId}" for a specified "{location}"'), target_fixture='unit_put_request')
def unit_put_request(requestor_Entity, requestor_Role,subscriber_id,subscriber_category, name, phone_no, email_id, alert_url, alertMode, entityId, location):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'subscriber_id':subscriber_id,'subscriber_category': subscriber_category, 'name': name, 'phone_no': phone_no, 'email_id': email_id, 'alert_url': alert_url, 'alertMode' : alertMode, 'entityId' : entityId, 'location' : location}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for requestor entity is "{requestor_Entity}" with role as "{requestor_Role}" for a subscriber with Id "{subscriber_id}" to update details for subscriber category "{subscriber_category}" with following details like "{name}" "{phone_no}" "{email_id}" for alert url "{alert_url}" with alert mode "{alertMode}" for an entity "{entityId}" for a specified "{location}"'), target_fixture='neg_put_request')
def neg_put_request(requestor_Entity, requestor_Role, subscriber_id, subscriber_category, name, phone_no, email_id, alert_url, alertMode, entityId, location):
    data = {'requestor_Entity': requestor_Entity, 'requestor_Role': requestor_Role, 'subscriber_id': subscriber_id, 'subscriber_category': subscriber_category, 'name': name, 'phone_no': phone_no, 'email_id': email_id, 'alert_url': alert_url, 'alertMode' : alertMode, 'entityId' : entityId, 'location' : location}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('an Update request for an endpoint /subscribers/update_subscriber/ is triggered to update existing subscriber for scheduler block'), target_fixture = 'post_request')
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
