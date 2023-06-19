Feature: Sample API tests
  Scenario: Test a Sample Get API
    Given url  "https://reqres.in/api/users?page=2"
    When method get
    Then status 200
    And print response
