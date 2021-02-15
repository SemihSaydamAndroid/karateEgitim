Feature:

  Background:

    * def asdf = read('WS_1.feature')
    * def result = call feature

    Scenario:
      Then print 'result--------', result
      # şimdi çalıştırdığın basic feature içindeki first_name'i alalım.
      * def first_name = result.response.data.first_name
      #response'un altında önce data var orayı kaçırma
      Then print 'first_name---------', first_name



      #Burada başka bir feature'i çağırıp çalıştıracağız. Bu önemli
