@regression
Feature: Priority Medium
  Scenario: if invalid number car_id is passed as the value , proper error message should be thrown instead of "Car is already booked for selected dates."
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"123","car_license_number":"KA01EM1000","total_rent_bill":26800,"from_date_time":"2021-05-23","to_date_time":"2021-04-27"}
    When method POST
    Then status 409
    And match response.error == true

  Scenario: if special characters is passed as the value for car_id field, proper error message should be thrown instead of "Car is already booked for selected dates."
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"!@#$%^&*()","car_license_number":"KA01EM1000","total_rent_bill":26800,"from_date_time":"2021-05-23","to_date_time":"2021-04-27"}
    When method POST
    Then status 409
    And match response.error == true

  Scenario: if empty string is passed as the value for car_id field, proper error message should be thrown instead of "Car is already booked for selected dates."
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"!@#$%^&*()","car_license_number":"KA01EM1000","total_rent_bill":26800,"from_date_time":"2021-05-23","to_date_time":"2021-04-27"}
    When method POST
    Then status 409
    And match response.error == true

  Scenario: if empty string is passed as the value for car_id field, proper error message should be thrown instead of "Car is already booked for selected dates."
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"!@#$%^&*()","car_license_number":"KA01EM1000","total_rent_bill":26800,"from_date_time":"2021-05-23","to_date_time":"2021-04-27"}
    When method POST
    Then status 409
    And match response.error == true
