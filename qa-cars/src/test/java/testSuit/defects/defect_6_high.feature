@regression
Feature: Priority High
  Background:
#    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
#    * def license_number = uuid()
    * def name = function(){ return java.lang.System.currentTimeMillis() }
    * def license_number = name()


  Scenario: If the value of the "car_license_number" field is passed as 0. Car is booked successfully.

    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number": 0,"total_rent_bill":19350,"from_date_time":"0002-01-23","to_date_time":"0002-01-27"}
    When method POST
    Then status 409
    And match response.error == true
#    since once the test had already ran, "Car is already booked for selected dates" error message will be thrown.
#    to do, write a code to generate random year to replicate the scenario
    And match response.message == "Car is already booked for selected dates."
    And print response

  Scenario: If the value of the "car_license_number" field is passed as digits. Car is booked successfully.

    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number": '#(license_number)',"total_rent_bill":19350,"from_date_time":"0002-01-23","to_date_time":"0002-01-27"}
    When method POST
#    since once the test had already ran, "Car is already booked for selected dates" error message will be thrown.
#    to do, write a code to generate random year to replicate the scenario
    Then status 200
    And match response.error == false
    And match response.message == "Your car is booked successfully."
    And print response

