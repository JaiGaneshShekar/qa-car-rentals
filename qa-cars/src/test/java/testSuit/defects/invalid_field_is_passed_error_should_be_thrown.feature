@regression
Feature: If an additional field is added to the Login API's and Book API's payload, error is not thrown.
  Scenario : If an additional field is added to the Login API's payload, error is not thrown.
    Given url baseUri + auth
    And request {"mobile": "9988776655","password": "testuser@123","additional": "additional field's Value"}
    When method POST
    Then status 200
    And match response.error == false
    * def auth = response.authToken

  Scenario : If an additional field is added to the Book API's payload, error is not thrown.
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + auth
    And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number":"KA01EM1000","total_rent_bill":26800,"from_date_time":"2021-05-23","to_date_time":"2021-04-27", "additional": "additional field's Value"}
    When method POST
    Then status 200
    And print response
