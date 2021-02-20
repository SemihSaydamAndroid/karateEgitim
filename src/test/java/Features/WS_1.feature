Feature: WS1

  Background:
    * url 'https://reqres.in/'

  @tag1
  Scenario: Http 200 kontrolü
    Given path 'api/users?page=2'
    When method GET
    Then status 200
    Then print response

  @tag1
  Scenario: Http 200 asdasd
    Given path 'api/users?page=3'
    When method GET
    Then status 200
    Then print response

  ## sdfasdf







