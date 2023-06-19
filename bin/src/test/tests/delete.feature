
  Feature: DELETE API DEMO

    Background:
      * url "https://reqres.in/api"
      * header Accept = 'application/json'

    # Simple Delete
    Scenario: Delete demo 1
      Given url "https://reqres.in/api/users/2"
      When method delete
      Then status 204
      And print responseStatus
      And print response


    # Delete with background
    Scenario: Delete demo 2
      Given path "/users/2"
      When method delete
      Then status 204
      And print responseStatus
      And print response