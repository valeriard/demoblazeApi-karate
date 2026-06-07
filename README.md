# 🧪 Demoblaze API Testing - Karate Framework

Proyecto de pruebas automatizadas para la API de [Demoblaze](https://www.demoblaze.com/) utilizando **Karate Framework**.

## 📋 Descripción

Este proyecto contiene pruebas automatizadas de API que validan las funcionalidades de registro (signup) y autenticación (login) de la plataforma Demoblaze.

## 🧰 Tecnologías Utilizadas

- **Java** 17
- **Karate DSL** 1.5.2
- **JUnit 5**
- **Gradle** 8.12

## 📁 Estructura del Proyecto
demoblaze-karate/ 
├── src/ 
└── test/ 
└── java/  
└── demoblaze/ 
├── demoblaze.feature # Escenarios de prueba 
└── DemoblazeRunnerTest.java # Test runner
├── build.gradle # Configuración de Gradle 
├── settings.gradle 
└── README.md

## ✅ Casos de Prueba

El proyecto incluye 4 escenarios de prueba:

1. **Caso 1:** Crear un nuevo usuario (signup exitoso)
2. **Caso 2:** Intentar crear un usuario ya existente
3. **Caso 3:** Login con usuario y password correctos
4. **Caso 4:** Login con password incorrecto

## 🚀 Prerequisitos

Antes de ejecutar el proyecto, asegúrate de tener instalado:

- **Java JDK 17** o superior
- **Gradle** 8.x (o usa el wrapper incluido)

### Verificar instalación de Java:

```cmd
java -version
```

📦 Instalación

1.Clonar el repositorio:
```bash
   git clone <url-del-repositorio>
   cd demoblaze-karate
```
2.Descargar dependencias:
```bash
gradlew clean build
```

▶️ Ejecución de Pruebas

Ejecutar todas las pruebas:
gradlew test

Ejecutar con más detalles:
gradlew test --info

Limpiar y ejecutar:
gradlew clean test

📊 Reportes

Después de ejecutar las pruebas, los reportes se generan automáticamente en:
Reporte de Karate (HTML):
build/karate-reports/karate-summary.html
Reporte de Gradle:
build/reports/tests/test/index.html
Para abrir el reporte en Windows:
start build\karate-reports\karate-summary.html

🧪 Ejemplo de Escenario

Scenario: Caso 3 - Login con usuario y password correctos
  Given path 'login'
  And request { username: '#(usuario)', password: '#(passOk)' }
  When method POST
  Then status 200
  And match response contains 'Auth_token'
  
🔧 Configuración

API Base URL:
https://api.demoblaze.com
Endpoints probados:
POST /signup - Registro de usuarios
POST /login - Autenticación de usuarios

📝 Notas Técnicas

Los usuarios se generan dinámicamente con timestamp para evitar conflictos
Las contraseñas se codifican en Base64 antes de enviarlas
Se utiliza callonce para compartir datos entre escenarios

🐛 Solución de Problemas

Error: "BUILD FAILED"
Verifica que Java 17 esté instalado
Ejecuta gradlew clean antes de volver a ejecutar
Error: "match failed"
Revisa que la API esté disponible
Verifica que el formato de las respuestas no haya cambiado

👨‍💻 Autor
Valeria Rivera

