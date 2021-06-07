Feature:
  Scenario:
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + getAllPath
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And print response
