Feature:

  Background:

    * def feature1 = read('WS_1.feature')
    * def result = call feature1

    Scenario:
      Then print 'result--------', result
      * def first_name = result.response.data.first_name
      Then print 'first_name---------', first_name

