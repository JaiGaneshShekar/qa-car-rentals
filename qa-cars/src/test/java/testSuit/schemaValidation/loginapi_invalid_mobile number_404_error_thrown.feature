@regression
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
      | 'Logging with the invalid mobile number' |  9988776656|testuser@123|404|true|'Sorry user not found.'|


