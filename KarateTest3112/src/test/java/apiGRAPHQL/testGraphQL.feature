@graphQLtest
Feature: Plan pruebas en GraphQL

  Scenario: Caso de Prueba 01
    Given url 'https://rickandmortyapi.com/graphql'
    When text query =
      """
      query{
        character(id:2)
        {
          name,
          status,
          species,
          gender
        }
      }
      """
    And request {query:'#(query)'}
    * method POST
    * match response.data.character.gender == 'Male'
    When status 200

  @CasoAutomatizacionPOST
  Scenario Outline: Caso de Prueba Automatiza GraphQL <nombreCaso>
    Given url 'https://rickandmortyapi.com/graphql'
    When text query =
      """
      query{
        character(id:<numero>)
        {
          gender
        }
      }
      """
    And request {query:'#(query)'}
    * method POST
    When status 200
    Examples:
      | nombreCaso   | numero |
      | Caso Normal  | 2      |
      | genero id 13 | 13     |
      | genero id 40 | 40     |
      | genero id 10 | 13     |
