@sanity
Feature: Customer logs into the application and searches the car for the desired date and checks the prices of the car and books the suitable car.
  Background: Customer logs in
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken

  Scenario Outline:
#   Customer as soon as he/she logs in gets all the list of cars
    Given url baseUri + getAllPath
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And print response

#   Then customer selects the desired date and checks for the availability of the cars
    Given url baseUri + searchCarsPath
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And print response

#   The customer then checks the prices of the car
    Given url baseUri + calculatePricePath
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200
    And print response

#   The customer then books the car
    Given url baseUri + bookCar
    And header Authorization = 'Bearer ' + authToken
    And request read('classpath:src/test/java/payload/bookCarPayload.json')
    When method POST
    Then status 409
    And print response

  Examples:
    | read('classpath:src/test/java/data/customerData.csv') |

