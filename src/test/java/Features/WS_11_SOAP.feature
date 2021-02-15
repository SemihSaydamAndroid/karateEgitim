Feature: test soap end point
  Background:
    * url 'http://www.dneonline.com/calculator.asmx'
    # WDSL : http://www.dneonline.com/calculator.asmx?WSDL

  # Request'i XML olarak direkt vermek.
  Scenario: soap 1.1
    Given request
    """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <Add xmlns="http://tempuri.org/">
          <intA>2</intA>
          <intB>3</intB>
        </Add>
      </soap:Body>
    </soap:Envelope>
    """
    When soap action 'http://tempuri.org/Add'
    Then status 200
    # And match /Envelope/Body/AddResponse/AddResult == 5
    * def myResult = /Envelope/Body/AddResponse/AddResult
    And assert myResult > 3
    Then print 'myResult----', myResult
    #And print 'response: ', response



  # Request'i xml'den okumak :

  Scenario: soap 1.2
    Given request read('request.xml')
    # soap is just an HTTP POST, so here we set the required header manually ..
    And header Content-Type = 'application/soap+xml; charset=utf-8'
    # .. and then we use the 'method keyword' instead of 'soap action'
    When method post
    Then status 200
    # note how we focus only on the relevant part of the payload and read expected XML from a file
    And match /Envelope/Body/AddResponse == read('expected.xml')


  # Parametre ile çalışmak :

  Scenario Outline: Creating a table <ahmet>
    Given request
    """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <Add xmlns="http://tempuri.org/">
          <intA>2</intA>
          <intB>3</intB>
        </Add>
      </soap:Body>
    </soap:Envelope>
    """
    When soap action 'http://tempuri.org/Add'
    Then status 200
    * def myResult = /Envelope/Body/AddResponse/AddResult
    And assert myResult > <ahmet>
    Then print 'myResult----', myResult
    Examples:
    |ahmet |
    | 3    |
    | 4    |
    | 5    |
    | 6    |


  # xml manipulation without Scenario Outline :

  @tag1
  Scenario: Karate replace keyword
    * def text = 'hello <key> world'
    * replace text.key = 'good'
    * match text == 'hello good world'
    * print 'myResponse-----', text


  # Retry until keyword :

  Scenario: Karate retry until keyword
    Given url 'https://jsonplaceholder.typicode.com/users/1'
    And retry until responseTime < 400
    When method get
   # Burada responseTime < 400 olana kadar deneyecektir.


  # Retry until 'and' keyword :

  Scenario: Karate retry until keyword and (&&)
    Given url 'https://jsonplaceholder.typicode.com/users/1'
    And retry until responseTime < 400 && responseStatus == 200
    When method get
   # Burada responseTime < 400 olana kadar deneyecektir.



  Scenario: Karate Maniulating Data with set keyword
    * def catName = <cat><name>Boncuk</name></cat>
    * set catName /cat/name = 'Zeytin'
    * match catName / == <cat><name>Zeytin</name></cat>

    # Burada sadece değer bazlı değil 'tag' bazlı da çalışabilirsiniz

    * def xml = <foo><bar>baz</bar></foo>
    * set xml/foo/bar = <hello>world</hello>
    * match xml == <foo><bar><hello>world</hello></bar></foo>


  Scenario: Karate Manipulating external .xml file
    * def myRequest = read('request.xml')
    * set myRequest/Envelope/Body/Add/intA = 4
    * set myRequest/Envelope/Body/Add/intB = 5
    # set işlemi yaparken '=' kullanıyoruz çünkü bir 'atama' işlemi yapıyoruz.
    Given request myRequest
    And header Content-Type = 'application/soap+xml; charset=utf-8'
    When method post
    Then status 200
    Then print response

  Scenario Outline: Karate BDD yaklaşımlı Manipulating external .xml file
    * def myRequest = read('request.xml')
    * set myRequest/Envelope/Body/Add/intA = <intA>
    * set myRequest/Envelope/Body/Add/intB = <intB>
    # set işlemi yaparken '=' kullanıyoruz çünkü bir 'atama' işlemi yapıyoruz.
    Given request myRequest
    And header Content-Type = 'application/soap+xml; charset=utf-8'
    When method post
    Then status 200
    Then print response
    * def result = /Envelope/Body/AddResponse/AddResult
    Then print '<intA> + <intB> işleminin sonucunda cevabımız', result , 'olarak okunmuştur'
    Examples:
    |intA | intB|
    |3    | 4   |
    |3    | 11  |
    | 63  | 234 |



    Scenario: Remove keyword
      * def xml = <foo><bar><hello>world</hello></bar></foo>
      * remove xml/foo/bar/hello
      * match xml == <foo><bar/></foo>
      * remove xml /foo/bar
      * match xml == <foo/>
      # Burada </foo> yerine <foo/> kullandığına dikkat et. Ama <foo></foo> verdiğinde de çalışıyor. Denersin onu




    #Buraya dikkat. Çok iyi
    Scenario: set işlemini tablo ile kullanarak xml request oluşturmak.

      * set search /acc:getAccountByPhoneNumber
        |path                         | value |
        |acc:phone/@foo               | 'bar' |
        |acc:phone/acc:number[1]      | 1234  |
        |acc:phone/acc:number[2]      | 5678  |
        |acc:phoneNumberSearchOption  | 'all' |

      * match search ==
      """
      <acc:getAccountByPhoneNumber>
        <acc:phone foo="bar">
          <acc:number>1234</acc:number>
          <acc:number>5678</acc:number>
        </acc:phone>
        <acc:phoneNumberSearchOption>all</acc:phoneNumberSearchOption>
      </acc:getAccountByPhoneNumber>
      """



