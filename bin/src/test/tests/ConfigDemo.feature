
  Feature: Config Demo

    Background:
      * url baseURL
      * header Accept = 'application/json'

    Scenario: Config demo 1
      Given print name

    Scenario: Config Demo 2
      Given path  "/users?page=2"
      And print baseURL
      When method get
      Then status 200
      And print response