@regression
Feature: Priority High
  Scenario: if an invalid "from and to date" which was passed to the calculate-price api, is passed to the book api, car is booked successfully.
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number":"KA01EM1000","total_rent_bill":19350,"from_date_time":"0001-01-23","to_date_time":"0001-05-27"}
    When method POST
    And print response
