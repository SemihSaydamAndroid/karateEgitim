Feature:

  Scenario:
    Given url 'https://reqres.in/api/users/1'
    When method get
    Then status 200
    Then print response
    * def data = response.data.email
    Then print 'data------', data

    * def myFun =
    """
     function(arg){
      return arg.length
     }
    """

    * def lengthS = call myFun data
    Then print lengthS





    #call myFun data'nın kullanışına dikkat et. Demo11.feature'de farklı kullanıyoruz. İkisini de öğren




