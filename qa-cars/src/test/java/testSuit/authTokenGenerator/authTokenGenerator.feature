@ignore
Feature: Authorization Token Generator
  Scenario:
    Given url baseUri+auth
#    And request read('classpath:src/test/java/payload/authPayload.json')
    And request {"mobile":"9988776655","password":"testuser@123"}
    When method POST
    Then status 200
    And def authToken = response.authToken

