@regression
Feature: Invalid Password passed, 401 error is thrown
  Scenario Outline: <Test Case>
    Given url baseUri+auth
    And request {"mobile": '<mobile>',"password": '<password>'}
    When method POST
    Then status <status>
    And match response.error == <error>
    And match response.message == <message>

    Examples:
      |Test Case| mobile |password|status|error|message|
      | 'Logging with the invalid password' | 9988776655 |estuser@123| 401|true|'Wrong username and password.'|


