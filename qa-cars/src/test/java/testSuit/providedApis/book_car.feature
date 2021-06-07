@ignore
Feature:
  Scenario:
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request read('classpath:src/test/java/payload/bookCarPayload.json')
    When method POST
    Then status 200
    And print response
