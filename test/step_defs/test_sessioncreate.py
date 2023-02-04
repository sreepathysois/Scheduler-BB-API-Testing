import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/session/create_session/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/sessioncreate.feature')
 
# Fixtures
 


@pytest.fixture
@given(parsers.parse('the "{RequestorEntity}" and "{RequestorRole}"'), target_fixture='create_session')
def create_session(RequestorEntity, RequestorRole):
    data = {'RequestorEntity': RequestorEntity, 'RequestorRole': RequestorRole}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response




@when(parsers.parse('I want to create new session using POST request'))
def create_session_pass():
    pass
    #return response



@then(parsers.parse('the response should return sessionID "{sessionID:d}"'))
def session_id_assert(create_session, sessionID):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = create_session.json()   
    print(assert_response)
    assert eval(assert_response) == sessionID 

@then(parsers.parse('the response should return sessionID with "{SessionID}"'))
def session_id_assert(create_session, SessionID):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = create_session.json()   
    print(assert_response)
    assert eval(assert_response) == eval(SessionID)

@then(parsers.parse('response code of POST request is "{code:d}"'))
def session_status_code(create_session, code):
    assert create_session.status_code == code	
