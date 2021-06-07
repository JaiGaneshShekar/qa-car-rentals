@sanity
Feature: Prices for the Cars
  Scenario Outline:
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + "car/calculate-price/" + '<id>' +"/2021-06-06/2021-06-10"
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And print response
  Examples:
    |id|
    | 6098bafd1ff5990015be8e20 |
    | 6098bb151ff5990015be8e21 |
    | 6098bb311ff5990015be8e22 |
    | 6098bb3f1ff5990015be8e23 |
    | 6098bb541ff5990015be8e24 |
    | 6098bb6e1ff5990015be8e25 |
    | 6098bb9c1ff5990015be8e26 |