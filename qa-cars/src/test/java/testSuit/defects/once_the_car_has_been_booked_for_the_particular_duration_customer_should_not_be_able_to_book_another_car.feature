@regression
Feature: Once the car has been booked for the particular duration by Customer, He/She can not book another car for the same duration.
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
     And match response.message == "Your car is booked successfully."
#    Customer tries to book another car for the same duration.
     Given url baseUri + bookCar
     And header Authorization = 'Bearer ' + authToken
     And request {"car_id":"6098bafd1ff5990015be8e21","car_license_number":"#(license)","total_rent_bill":26800,"from_date_time":"2020-06-06","to_date_time":"2020-06-10"}
     When method POST
     Then status 200
     And match response.message == "Your car is booked successfully."