Feature: prueba API

Background:
 * configure ssl = true
  * def numeroPagina = 1
  * def jsonResponse = read('classpath:/data/resp/ListOfUsers.json')
  * def token = call read('classpath:/resources/ObtenerToken.feature@token')

  @test01 @regresion
  Scenario: Listar Usuario
    Given url baseURL
    * print token.nombretoken
    * path '/api/users'
    * param page = numeroPagina
    When method GET
    Then status 200
    * print response
    And match  response == jsonResponse
    And  match response.data[0].first_name == "George"

  @test02 @regresion
  Scenario: Listar usuario pagina 2
    Given url baseURL
    * path '/api/users?page=2'
    When method GET
    Then status 200
    * print response

  @regresion
  Scenario: Listar usuario pagina 2  y validar correo
    Given url baseURL
    * path '/api/users?page=2'
    When method GET
    Then status 200
    * print response
    * def correoObtenido = response.data[0].email
    * print correoObtenido
    * match correoObtenido == "janet.weaver@reqres.in"

  @regresion
  Scenario: Listar usuario pagina 2
    Given url baseURL
    * path '/api/users?page=2'
    When method GET
    Then status 200
    * print response
    * def correoObtenido = response.data[0].email
    * print correoObtenido
    * match correoObtenido == "janet.weaver@reqres.in"

