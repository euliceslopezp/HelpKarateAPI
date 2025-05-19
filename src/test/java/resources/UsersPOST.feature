Feature: prueba API

  Background:
    * configure ssl = true

  @test201
  Scenario: Crear Usuario
    Given url baseURL
    * path '/api/users'
    * request {"name": "Eulices","job": "Student"}
    When method POST
    Then status 201
    * print response
    * def responseAPI = response
    * match responseAPI == {createdAt: '#notnull', name: '#notnull', id: '#notnull',job: '#notnull'}
    *  match  responseAPI.name == "Eulices"

  Scenario Outline: Crear 3 Usuarios : <id> - <name> y <job>
    Given url baseURL
    * path '/api/users'
    * request {"name": "#(name)","job": "#(job)"}
    When method POST
    Then status 201
    * print response
    Examples:
      | id | name   | job      |
      | 1  | Maria  | Student  |
      | 2  | Pepito | teacher  |
      | 3  | Miguel | Engineer |

  Scenario: crear usuario con request json
    * def bodyrequest = read('classpath:data/req/UsuarioNew.json')
    Given url baseURL
    * path '/api/users'
    * request bodyrequest
    When method POST
    Then status 201
    * print response

  Scenario Outline: Crear Usuarios desde un archivo Json
    Given url baseURL
    * configure ssl = true
    * path '/api/users'
    * request {"name": "<name>","job": "<job>"}
    When method POST
    Then status 201
    * print response
    Examples:
    |read('classpath:data/req/UsersDataDrivenConJson.json') |

  Scenario: validar schema de una API
    Given url baseURL
    * path '/api/users'
    And request {"name": "Alex","job": "tester"}
    And method post
    Then status 201
    * def schema = read('classpath:data/resp/createUserSchema.json')
    And match response == schema
    And print response


  Scenario: crear usuario desde una función de un clase java
    Given url baseURL
    * def utilGeneraNombres = Java.type('util.Util')
    * def nameRandom = utilGeneraNombres.randomName()
    * print 'El nombres random es: ' + nameRandom
    * path '/api/users'
    And request {"name": "#(nameRandom)","job": "tester"}
    And method post
    Then status 201
    And print response