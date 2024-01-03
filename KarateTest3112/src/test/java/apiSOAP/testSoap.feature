@soapRequest

Feature: Plan de Pruebas orientado a consultas SOAP

  Scenario: Caso de Pruebas 01 - POST
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    When header Content-Type = 'text/xml'
    And request
      """
      <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
        <soap:Body>
          <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
            <ubiNum>500</ubiNum>
          </NumberToWords>
        </soap:Body>
      </soap:Envelope>
      """
    And method POST
    And match response/Envelope/Body/NumberToWordsResponse/NumberToWordsResult == 'five hundred '
    Then status 200

  @CasoAutomatizacionPOST
  Scenario Outline: Caso de Prueba AUTO POST SOAP - <casoPrueba>
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    When header Content-Type = 'text/xml'
    And request
      """
      <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
        <soap:Body>
          <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
            <ubiNum><num></ubiNum>
          </NumberToWords>
        </soap:Body>
      </soap:Envelope>
      """
    And method POST
    And match response/Envelope/Body/NumberToWordsResponse/NumberToWordsResult == '<asercion> '
    Then status <statusA>
    Examples:
      | casoPrueba            | num   | statusA | asercion      |
      | Numero 800            | 800   | 200     | eight hundred |
      | Numero 11             | 11    | 200     | eleven        |
      | Numero 200            | 200   | 200     | two hundred   |
      | Numero Formato String | "800" | 200     | #string       |
      | Numero null           | null  | 200     | #number       |
      | Numero vacio          |       | 200     | #object       |

