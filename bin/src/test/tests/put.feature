
  Feature: PUT API DEMO

    Background:
      * url "https://reqres.in/api"
      * header Accept = 'application/json'

    # Simple Put request
    Scenario: Put Demo 1
      Given url "https://reqres.in/api/users/2"
      And request {"name":"Musab", "job": "Lead Automation Engineer"}
      When method put
      Then status 200
      And print response

    # Put with Background
    Scenario: Put Demo 2
      Given path "/users/2"
      And request {"name":"Mohsin", "job": "Automation Manager"}
      When method put
      Then status 200
      And print response

    # Put with Assertions
    Scenario: Put Demo 3
      Given path "/users/2"
      And request {"name":"Mohsin", "job": "Automation Manager"}
      When method put
      Then status 200
      And match response == {"updatedAt":"#ignore", "name":"Mohsin", "job":"Automation Manager"}
      And print response


