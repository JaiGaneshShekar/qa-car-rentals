@sanity
Feature: In the Calculate Price API, Customer is restricted to book the car for seven days only.
    Scenario:
      * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
      * def authToken = response.response.authToken
      Given url baseUri + "car/calculate-price/6098bafd1ff5990015be8e20/2021-06-06/2021-06-20"
      And header Authorization = 'Bearer ' + authToken
      When method GET
      Then status 403
      And match response.message == "You can't select more than 7 days."