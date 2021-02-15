Feature: Java functions

  Scenario: Call Function

    * def JavaDemo = Java.type('Features.JavaFunctions')
    # 'packageName.ClassName' şeklinde bir tanımlama ile ulaştık.
    * def result = new JavaDemo().callJavaFunction()

  Scenario: Call Function with argument

    * def JavaDemo = Java.type('Features.JavaFunctions')
    * def result = new JavaDemo().callWithArgument('Semih')
    Then print result

  Scenario: Call Function with argument and write txt
    * def JavaDemo = Java.type('Features.JavaFunctions')
    * def result = new JavaDemo().writeData('dasfasdfasdf medium ! :)')


  Scenario: write API response to txt
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200
    Then print response
    * def data = response.data
    Then print 'data----',data

    * def myFun =
    """
    function(arg){
      for(i=0; i<arg.length; i++){
        if(arg[i].id == 9){
          return arg[i].email
        }
      }
    }
    """

    * def userEmail = call myFun data
    Then print 'userEmail-----',userEmail

    * def JavaDemo = Java.type('Features.JavaFunctions')
    * def result = new JavaDemo().writeData(userEmail)
    # Data.txt içine API'den gelen response'dan id:9 olanın email'ini alıp yazdık. :)