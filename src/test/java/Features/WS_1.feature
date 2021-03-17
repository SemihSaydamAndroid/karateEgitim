Feature: sdfasd

  Background:
    * url 'https://reqres.in/'

  @tag1
  Scenario: Http 200 kontrolü
    Given path 'api/users?page=2'
    When method GET
    Then status 200
    Then print response
    * match response.data[*].id[0] == 1



