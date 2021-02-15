Feature: WS1

#  Background:
#    * url 'https://reqres.in/'

  @tag1
  Scenario: Http 200 kontrolü
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    Then print response











