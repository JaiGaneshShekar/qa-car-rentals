@sanity
Feature: Once the car has been booked by a customer and then tries to again book the same car.
  Background:
    * def className = Java.type('utils.RandomStringGenerator')
    * def license = className.randomString()
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
  Scenario:
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number":"#(license)","total_rent_bill":26800,"from_date_time":"2021-06-06","to_date_time":"2021-06-10"}
    When method POST
    Then status 200
#    Customer tries to book the same car
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number":"#(license)","total_rent_bill":26800,"from_date_time":"2021-06-06","to_date_time":"2021-06-10"}
    When method POST
    Then status 409
    And match response.message == "Car is already booked for selected dates."