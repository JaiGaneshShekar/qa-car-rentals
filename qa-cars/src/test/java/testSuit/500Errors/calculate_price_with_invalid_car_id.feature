@regression
Feature: Priority High
  Scenario: When the customer passes invalid car id in the calculate-price api endpoint,  500 error is thrown

    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + "car/calculate-price/6098bb151ff5990015be8e2/2021-05-23/2021-05-27"
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 500
    And match response.error == true
    And match response.message == "Server Crashed"
    And match response.status == false
    And print response

