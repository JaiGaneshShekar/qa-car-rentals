@sanity
Feature: Login Check
  Scenario Outline: <Test Case>
    Given url baseUri+auth
    And request {"mobile": '<mobile>',"password": '<password>'}
    When method POST
    Then status <status>
    And match response.error == <error>
    And match response.message == <message>

    Examples:
      |Test Case| mobile |password|status|error|message|
      | 'Logging in with the valid credentials' | 9988776655 |testuser@123|200|false|'User logged in successfully.'|
      | 'Logging with the invalid mobile number' |  9988776656|testuser@123|404|true|'Sorry user not found.'|
      | 'Logging with the invalid password' | 9988776655 |estuser@123| 401|true|'Wrong username and password.'|


