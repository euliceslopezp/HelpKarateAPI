Feature: Pet store API

    Background:
      * configure ssl = true
      Given url 'https://petstore.swagger.io'
      * def petId = 1.6
      * def numTarjeta = 1234567890123456

      Scenario: Listar Mascotas por codigo
       # Given url urlMascotas
        * header Accept = 'application/json'
        * if (petId == null || !Number.isInteger(petId)) karate.fail('El petId debe ser un número entero')
        * path '/v2/pet/'+ petId
        When method GET
        Then status 200
        * print response

  Scenario Outline: Listar mascotas x estado <estado>
    * def nombreStatus = <estado>
    * path '/v2/pet/findByStatus'
    * param status = nombreStatus
    When method get
    Then status 200
    Then match  each response[*].status == <estado>
    Examples:
      | estado      |
      | "available" |
      | "pending"   |
      | "sold"      |
