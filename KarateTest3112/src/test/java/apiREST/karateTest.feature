Feature: Plan de Pruebas 01

  Scenario: Caso de Pruebas 01 - GET
    Given url 'https://reqres.in/api/users/2'
    When method GET
    #And match response.data.last_name == 'Janet'
    #And match response.data.last_name == '#string'
    #And match response.data.last_name == '#number'
    #And match response.data.id == '#number'
    And match response.data.id == 2
    Then status 200


  Scenario: Caso de Pruebas 02 - POST
    Given url 'https://reqres.in/api/users'
    #When request {"name":"morpheus","job": "leader"}
    When request
    """
    {
    "name":"morpheus",
    "job":"leader"
    }
    """
    And method POST
    Then status 201


  Scenario: Caso de Pruebas 03 - DELETE
    Given url "https://reqres.in/api/users/2"
    When method DELETE
    Then status 204

  Scenario: Caso de Pruebas 04 - Configure
    Given url 'https://reqres.in/api/users/2'
    When header 'Content-Type' = 'Application/json'
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    * method GET
    And match response.data.id == 2
    Then status 200


  Scenario Outline: Caso de Pruebas - GET <nombreCaso>
    Given url 'https://reqres.in/api/users/<ID>'
    When header 'Content-Type' = 'Application/json'
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    * method GET
    #And match response.data.id == 2
    Then status <estadoHTTP>
    Examples:
      | nombreCaso        | ID | estadoHTTP |
      | Caso Id 1         | 1  | 200        |
      | Caso Id 2         | 2  | 200        |
      | Caso Id 3         | 3  | 200        |
      | Caso Id Not Found | 50 | 404        |

  @CasoAutomatizacionPOST
  Scenario Outline: Caso de Pruebas - POST <nombreCaso>
    Given url 'https://reqres.in/api/users'
    #When request {"name":"morpheus","job": "leader"}
    When request
    """
    {
    "<name>":<Vname>,
    "<job>":<Vjob>
    }
    """
    And method POST
    Then status 201
    Examples:
      | nombreCaso     | name | Vname  | job | Vjob |
      | Name Vacio     | name |        | job | QA   |
      | Name Nulo      | name | null   | job | QA   |
      | Name 3 Letras  | name | "sol"  | job | QA   |
      | Sin Campo Name |      |        | job | QA   |
      | Job Vacio      | name | Jeremy | job | ""   |
      | Job Nulo       | name | Jeremy | job | null |
      | Job 3 Letras   | name | Jeremy | job | QAs  |
      | Sin Campo Job  | name | Jeremy |     | QA   |
