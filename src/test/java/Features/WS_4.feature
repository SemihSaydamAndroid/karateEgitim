Feature: Baeldung sitesinden alınanlar burada
  
  Background: 
    * url 'https://jsonplaceholder.typicode.com'
    * header Accept = 'application/json'

    Scenario: Testing the exact response of a GET endpoint
    Given path 'users'
    When method get
    Then status 200
    Then assert response.length == 10

    * def first = response[1]
    Given path 'users',first.id
    When method get
    Then status 200

    Then print first.name
    Then print first.id
    And match $.id == 2
#    And match response contains {id:1,name:'Leanne Graham'}


