Feature: prueba API

  Background:
    * configure ssl = true
    * def numeroPagina = 1
    * def jsonResponse = read('classpath:/data/resp/ListOfUsers.json')

  @token
  Scenario: Listar Usuario
    Given url baseURL
    * path '/api/users'
    * param page = numeroPagina
    When method GET
    Then status 200
    * def response = response
    * print response
    * def nombretoken = response.data[0].first_name
    * print nombretoken
    * def numeroPage = response.per_page
    *  print numeroPage
    * if (response.per_page) karate.call('classpath:/resources/ObtenerToken.feature@token2', { page : numeroPage })

  @token2
  Scenario: Listar Usuario mas 5 usarios
    * def perpage = __arg.page
    * print perpage
    Given url baseURL
    * path '/api/users'
    * param page = numeroPagina
    When method GET
    Then status 200
    * def response = response
    * print response
    * def nombretoken = response.data[0].first_name
    * print nombretoken


#
#    * match $.nombre == '#string' // Verifica si la clave "nombre" existe y tiene un valor de tipo string
#
#    * if ($.nombre != null) { // Condición if para validar existencia
#    * print 'La clave "nombre" existe'
#    } else {
#    * print 'La clave "nombre" no existe'
#  }


    # * karate.set
#    And  match response == jsonResponse
#    And match response.data[0].first_name == "George"