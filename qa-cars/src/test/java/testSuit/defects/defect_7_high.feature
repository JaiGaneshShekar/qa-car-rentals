@regression
Feature: the max value and min value validation has not been incorporated.
  Background:
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken

  Scenario Outline:  <Test Case>
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request {"car_id": '6098bafd1ff5990015be8e20',"car_license_number": '<car_license_number>',"total_rent_bill":26800,"from_date_time":"2021-05-23","to_date_time":"2021-04-27"}
    When method POST
    Then status 409
    Examples:
    |Test Case| car_license_number |
    | 'maximum value to be passed to car_id and car_license_number is not limited ' | asssssssssssssssssssssssssssssssssssssssssssssssssssss |
    | 'maximum value to be passed to car_id and car_license_number is not limited ' | asssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssssssssssss |
    | 'minimum value to be passed to car_id and car_license_number is not limited ' | aa |

