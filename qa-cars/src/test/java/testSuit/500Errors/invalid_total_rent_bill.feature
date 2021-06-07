@regression
Feature: Priority High
  Scenario: If from_date_time field is passed as an invalid string in the book api, 500 error

    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number":"KA01EM1000","total_rent_bill":"1234sdf","from_date_time":"2021-05-23","to_date_time":"2021-05-23"}
    When method POST
    Then status 500
    And match response.error == true
    And match response.message == "Server Crashed"
    And match response.status == false
    And print response

