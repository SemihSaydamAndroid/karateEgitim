Feature: user Details

  @tag1 @tag3
  Scenario: create a user
    * def user = read('data.json')
    * set user.secondRequest.name = 'mehmet'
    * set user.secondRequest.job = 'sdfasdf'
    * print user.secondRequest

    Given url 'https://reqres.in/api/users'
    And request user.secondRequest
    When method post
    Then status 201
    Then print response

  Scenario:
  * def user = read('data.json')
  * print user

#    Given url 'https://reqres.in/api/users'
#    And request user.firstRequest
#    When method post
#    Then status 201
#    Then print response

