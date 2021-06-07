@regression
Feature: Priority High
  Background:
    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    * def license_number = uuid()
  Scenario: If the value of the "car_license_number" field, which is not listed in the "Get-ALL" api is passed. Car is booked successfully.

    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number": '#(license_number)',"total_rent_bill":19350,"from_date_time":"0002-01-23","to_date_time":"0002-01-27"}
    When method POST
    Then status 200
    And match response.error == false
    And match response.message == "Your car is booked successfully."
    And print response

