@regression
Feature: When the customer passes the "from date" as present day and "to date" as past date to the calculate price api's endpoint, API doesn't throw an error instead "totalRentAmount" value is returned in the response".
  Scenario: "from date" is present day and "to date" is yesterday date
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + "car/calculate-price/6098bb151ff5990015be8e21/2021-06-03/2021-06-02"
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And match response.error == false
    And print response

  Scenario: "from date" is present day and "to date" is 2 days back date
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + "car/calculate-price/6098bb151ff5990015be8e21/2021-06-03/2021-06-01"
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And match response.error == false
    And print response

  Scenario: "from date" is present day and "to date" is 3 days back date
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + "car/calculate-price/6098bb151ff5990015be8e21/2021-06-03/2021-05-31"
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And match response.error == false
    And print response

  Scenario: "from date" is present day and "to date" is 4 days back date
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + "car/calculate-price/6098bb151ff5990015be8e21/2021-06-03/2021-05-30"
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And match response.error == false
    And print response

  Scenario: "from date" is present day and "to date" is 5 days back date
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + "car/calculate-price/6098bb151ff5990015be8e21/2021-06-03/2021-05-29"
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And match response.error == false
    And print response

  Scenario: "from date" is present day and "to date" is 6 days back date
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + "car/calculate-price/6098bb151ff5990015be8e21/2021-06-03/2021-05-28"
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And match response.error == false
    And print response

  Scenario: "from date" is present day and "to date" is 7 days back date
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + "car/calculate-price/6098bb151ff5990015be8e21/2021-06-03/2021-05-27"
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And match response.error == false
    And print response
