@regression
Feature: Priority High
  Scenario: If car_license_number field is passed as an empty string in the book api, 500 error

    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number":"","total_rent_bill":19350,"from_date_time":"0002-01-23","to_date_time":"0002-05-27"}
    When method POST
    Then status 500
    And match response.error == true
    And match response.message == "Server Crashed"
    And match response.status == false
    And match response.errorMessage == "Booking validation failed: car_license_number: Path `car_license_number` is required."
    And print response

