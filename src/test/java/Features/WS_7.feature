Feature:

  Background:

    * def expectedOutput = read('../Features/users2.json')

  Scenario:
#    Given url 'https://reqres.in/api/users/1'
#    When method get
#    Then status 200
#    Then print response
#    And match response == expectedOutput[0]
    # ilk fonksiyonumuzu tanımlayalım. Bunu fonksyionun kısaysa yaparsın fakat fonksiyonun uzarsa bu şekilde yazman hoş olmaz.

    * def myFunc1 = function() { return 'Hello' }
    * def returnedData1 = call myFunc1



    Then print 'returnedData---------', returnedData1

    # Burada ise fonksiyonu biraz daha düzenli yazıyoruz. Bunu tercih etmen daha hoş olur.
    * def myFunc2 =
    """
      function(){
         return 'myData'
       }
    """
    * def returnedData2 = call myFunc2
    Then print 'returnedData2--------', returnedData2




