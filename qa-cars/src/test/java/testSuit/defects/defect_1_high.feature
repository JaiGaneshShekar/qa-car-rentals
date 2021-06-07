@regression
Feature: Priority High
  Scenario Outline: <Test case>

    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + "car/calculate-price/6098bb151ff5990015be8e21/"+'<from_and_to_date>'
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And match response.error == false

  Examples:
    | Test case|from_and_to_date|
    | 'When the customer passes past "from and to date" to the calculate price api, the api should thrown an error "past date is not allowed".'|2020-05-23/2020-05-27|
    | 'When the customer passes invalid "from and to date" to the calculate price api, the api should thrown an error "past date is not allowed".'|0005-05-23/0005-05-23|