@regression
Feature: If the invalid JWT token is passed as authorization to the apis.
  Background:
    * def response = call read('classpath:src/test/java/testSuit/authTokenGenerator/authTokenGenerator.feature')
    * def authToken = response.response.authToken

  Scenario Outline:  <Test Case>
    Given url baseUri + '<end_point>'
    And header Authorization = 'Bearer ' + <auth_token>
    When method GET
    Then status <status>

    Examples:
      |Test Case| end_point | auth_token | status|
      | 'Invalid JWT Token passed to Get All API' | car/all | 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MDk4YjY3NDJhMmU2ODM0NWNlMzkxZGQiLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjIyODYwNjc2fQ.zz1696kudYLsaVcrnsjAC49MtK8tmO09QYbG_OcGIU' |401|
      | 'Invalid JWT Token passed to Search API' |  car/search-cars/2021-05-23/2021-05-24 | 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MDk4YjY3NDJhMmU2ODM0NWNlMzkxZGQiLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjIyODYwNjc2fQ.zz1696kudYLsaVcrnsjAC49MtK8tmO09QYbG_OcGIU' |401|
      | 'Invalid JWT Token passed to Calculate Price API' | car/calculate-price/6098bafd1ff5990015be8e20/2021-05-23/2021-05-24 | 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MDk4YjY3NDJhMmU2ODM0NWNlMzkxZGQiLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjIyODYwNjc2fQ.zz1696kudYLsaVcrnsjAC49MtK8tmO09QYbG_OcGIU' |401|
