@regression
Feature:
    Background:
      * def className = Java.type('utils.RandomStringGenerator')
      * def license = className.randomString()

    Scenario: Booking possible for past date
      * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
      * def authToken = response.response.authToken
      Given url baseUri + bookCar
      And header Authorization = 'Bearer ' + authToken
      And request {"car_id":"6098bafd1ff5990015be8e20","car_license_number":"#(license)","total_rent_bill":26800,"from_date_time":"2020-05-23","to_date_time":"2020-04-27"}
      When method POST
      Then status 200
      And print response