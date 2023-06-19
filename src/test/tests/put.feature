
  Feature: PUT API DEMO

    Background:
      * url "https://reqres.in/api"
      * header Accept = 'application/json'
      * def expectedOutput = read("putResponse.json")

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
      And request {"name":"Anas Khan", "job": "Lead Automation Engineer"}
      When method put
      Then status 200
      And match response == {"updatedAt":"#ignore", "name":"Anas Khan", "job":"Lead Automation Engineer"}
      And print response

    # Read request from json file and assert response with Json file
    Scenario: Post DEMO 4
      Given  path "/users/2"
      And def requestBody = read("request1.json")
      And request  requestBody
      When method put
      Then status 200
      And match response == expectedOutput
      And print response

    # Read Put request from json file from another folder
    Scenario: Post DEMO 5
      Given  path "/users/2"
      And def projectPath = karate.properties["user.dir"]
      And print projectPath
      And def filePath = projectPath+'src/test/java/Data/request1.json'
      And print filePath
      And request filePath
      When method put
      Then status 200
      And print response
