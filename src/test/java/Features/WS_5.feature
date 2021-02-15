Feature: API Authentication
  Background:

    * url 'https://reqres.in/api/register'

  @Get
    Scenario: Successful register

      * def params =
      """
        {
           "email": "eve.holt@reqres.in",
           "password": "pistol"
        }
      """
#     And form fields params
     And request params
     When method post
     Then status 200
     Then print 'response-----', response

     * def access_token = response.token
     Then print 'access_token-----', access_token

