Feature: Karate Dss

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * header Accept = 'application/json'

    @Get @Transaction
    Scenario: get all users and then get the first user by id
    * path 'users'
    * method get
    * status 200
    * print 'Çalışma zamanım : ',responseTime/1000, ' saniye şeklindedir.'
    * assert responseTime < 4000

