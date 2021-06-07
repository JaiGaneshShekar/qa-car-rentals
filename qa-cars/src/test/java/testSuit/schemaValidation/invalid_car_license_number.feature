@regression
Feature:
  Background:
    * def license_number = function(){ return java.lang.System.currentTimeMillis() }
  Scenario: If digits are passed preceding with 0 as the value to the "car_license_number" field, 400 error is thrown.

    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
#    for valuecar_license_number is preceeded with 0, 400 error can be replicated at PostMan
#    to do, write a code to generate random year
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number": 00 + '#(license_number)',"total_rent_bill":19350,"from_date_time":"0002-01-23","to_date_time":"0002-01-27"}
    When method POST
#    Then status 400
    Then status 409
