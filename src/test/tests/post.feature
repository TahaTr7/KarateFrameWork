
Feature: POST API Demo

  Background:
    * url "https://reqres.in/api"
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  # Simple Post request
  Scenario: Post DEMO 1
    Given url "https://reqres.in/api/users"
    And request {"name":"Taha", "job":"QA Automation Engineer"}
    When method post
    Then status 201
    And print response

  # Post with Background
  Scenario: Post DEMO 2
    Given path "/users"
    And request {"name":"Nazoor", "job":"QA Automation Engineer"}
    When method post
    Then status 201
    And print response

  # Post with Assertions
  Scenario: Post DEMO 3
    Given  path "/users"
    And request {"name":"Adil", "job":"QA Automation Engineer"}
    When method post
    Then status 201
    And match response == {"createdAt":"#ignore", "name":"Adil", "id":"#string", "job":"QA Automation Engineer"}
    And print response

  # Post get response from json file
  Scenario: Post DEMO 4
    Given  path "/users"
    And request {"name":"Adil", "job":"QA Automation Engineer"}
    When method post
    Then status 201
    And print response
    And match response == expectedOutput
    And print response

    # read request from json file
  Scenario: Post DEMO 5
    Given  path "/users"
    And def requestBody = read("request1.json")
    And request requestBody
    When method post
    Then status 201
    And match response == expectedOutput
    And print response

  # read request from json file
  Scenario: Post DEMO 6
    Given  path "/users"
    And def projectPath = karate.properties["user.dir"]
    And print projectPath
    And def filePath = projectPath+'src/test/java/Data/request1.json'
    And print filePath
    And request filePath
    When method post
    Then status 201
    And print response

  #  Read body data from file and change the request values
  Scenario: Post DEMO 7
    Given  path "/users"
    And def requestBody = read("request1.json")
    And request requestBody
    And set requestBody.job = "Software Engineer"
    When method post
    Then status 201
    And print response
