Feature: Karate General

  Scenario: : Definir una variable
    Given def nombre = 'Eulices'
    * print 'El nombre es: ' + nombre


  Scenario: : funcion Assert
    Given def color = 'red '
    And def num = 5
    Then assert color + num == 'red 5'