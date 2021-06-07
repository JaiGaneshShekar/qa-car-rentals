@regression
Feature: if a invalid value is passed as "total_rent_bill", instead of price mismatch error "Car is already booked for selected dates." is thrown

  Scenario: if a different value is passed as "total_rent_bill", instead of price mismatch error "Car is already booked for selected dates." is thrown
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number":"KA01EM1000","total_rent_bill":1935,"from_date_time":"0001-05-23","to_date_time":"0005-01-27"}
    When method POST
    Then status 409
    And print response
    And match response.error == true

  Scenario: if 0 is passed as "total_rent_bill", instead of price mismatch error "Car is already booked for selected dates." is thrown
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number":"KA01EM1000","total_rent_bill":0,"from_date_time":"0001-05-23","to_date_time":"0005-01-27"}
    When method POST
    Then status 409
    And print response
    And match response.error == true

  Scenario: if invalid entry is passed as "total_rent_bill", instead of price mismatch error "Car is already booked for selected dates." is thrown
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number":"KA01EM1000","total_rent_bill":"asdffd","from_date_time":"0001-05-23","to_date_time":"0005-01-27"}
    When method POST
    Then status 409
    And print response
    And match response.error == true