Feature: user Details

  @tag1 @tag3
  Scenario: create a user
    * def user = read('data.json')
    * set user.secondRequest.name = 'mehmet'
    * set user.secondRequest.job = 'sdfasdf'
    * print 'burası ilk print',user.secondRequest

    Given url 'https://reqres.in/api/users'
    And request user.secondRequest
    When method post
    Then status 201
    Then print response
    * def myResponseNameAre = response.name
    * match myResponseNameAre == 'mehmet'


    Given path 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    Then print response



#  Scenario:
#  * def user = read('data.json')
#  * print user
#
##    Given url 'https://reqres.in/api/users'
##    And request user.firstRequest
##    When method post
##    Then status 201
##    Then print response

