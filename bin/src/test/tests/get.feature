Feature: Get API DEMO
  Background:
    * url "https://reqres.in/api"
    * header Accept = 'application/json'

    #Simple Get request
  Scenario: Get Demo 1
    Given url  "https://reqres.in/api/users?page=2"
    When method get
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #Get with background
  Scenario: Get Demo 2
    Given path  "/users?page=2"
    When method get
    Then status 200
    And print response

  #Get with path and param
  Scenario: Get Demo 3
    Given path  "/users"
    And params page = 2
    When method get
    Then status 200
    And print response

  #Get with Assertions
  Scenario: Get Demo 4
    Given path  "/users"
    And params page = 2
    When method get
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[3].id == 4
    And match response.data[4].last_name == 'Morris'

