@csv&json
  Feature: Cargar CSV y JSON
    Scenario Outline: Caso de Pruebas CSV - POST <nombreCaso>
      Given url 'https://reqres.in/api/users'
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
        | read('test.csv')|


  Scenario Outline: Caso de Pruebas JSON - POST <nombreCaso>
    Given url 'https://reqres.in/api/users'
    When def body = read('body.json')
    And request body
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