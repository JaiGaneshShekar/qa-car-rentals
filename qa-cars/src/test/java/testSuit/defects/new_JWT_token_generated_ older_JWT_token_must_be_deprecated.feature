@regression
Feature: When the new JWT token has been generated, the older JWT token must be deprecated
   Background:
     * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
     * def authToken = response.response.authToken
   Scenario Outline: <Test Case>
     Given url baseUri + '<end_point>'
     And header Authorization = 'Bearer ' + "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MDk4YjY3NDJhMmU2ODM0NWNlMzkxZGQiLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjIyOTk3ODEyfQ.QipO7Mjk6UZc6fGs89C2bqGLzmjjUUkdbJW9o6vLseU"
     When method GET
     Then status <status>

   Examples:
   |Test Case| end_point | status|
   | 'For Get All API' | car/all |200|
   | 'For Search Car API' |  car/search-cars/2021-05-23/2021-05-24 |200|
   | 'For Calculate Price API' | car/calculate-price/6098bafd1ff5990015be8e20/2021-05-23/2021-05-24 |200|
