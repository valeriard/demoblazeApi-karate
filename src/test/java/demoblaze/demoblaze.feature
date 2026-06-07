Feature: Pruebas de API - Signup y Login en Demoblaze

  Background:
    * url 'https://api.demoblaze.com'
    * def generarUsuario =
      """
      function() {
        var Base64 = Java.type('java.util.Base64');
        var passwordPlano = 'Kekate123';
        var passwordBase64 = Base64.getEncoder().encodeToString(passwordPlano.getBytes());
        return { username: 'karate_user_' + new Date().getTime(), passOk: passwordBase64 };
      }
      """
    * def datos = callonce generarUsuario
    * def usuario = datos.username
    * def passOk  = datos.passOk
    * def passMal = 'cGFzc3dvcmRJbmNvcnJlY3Rv'

  Scenario: Crear un nuevo usuario (signup exitoso)
    Given path 'signup'
    And request { username: '#(usuario)', password: '#(passOk)' }
    When method POST
    Then status 200
    And match response !contains 'errorMessage'

  Scenario:  Intentar crear un usuario ya existente
    Given path 'signup'
    And request { username: '#(usuario)', password: '#(passOk)' }
    When method POST
    Then status 200
    And match response == { errorMessage: 'This user already exist.' }

  Scenario:  Login con usuario y password correctos
    Given path 'login'
    And request { username: '#(usuario)', password: '#(passOk)' }
    When method POST
    Then status 200
    And match response contains 'Auth_token'

  Scenario:  Login con password incorrecto
    Given path 'login'
    And request { username: '#(usuario)', password: '#(passMal)' }
    When method POST
    Then status 200
    And match response == { errorMessage: 'Wrong password.' }"Auth_token: a2FyYXRlX3VzZXJfMTc4MDg2NDY4Mzk4MzE3ODE0NjQ="\n