# Mi Servicio Web PHP con Docker

Este proyecto contiene una API REST en PHP que gestiona usuarios y contactos.

## Requisitos

*   Docker
*   Docker Compose

## Nota importante sobre la conexión a la base de datos

El código PHP se conecta a `localhost` para acceder a MySQL. Como el contenedor de la base de datos expone el puerto 3306 en tu máquina local (Windows), y el contenedor web tiene acceso a `host.docker.internal`, la conexión debería funcionar. Sin embargo, si experimentas problemas de conexión, asegúrate de que no haya otra instancia de MySQL corriendo en tu máquina en el puerto 3306.

## Cómo ejecutar el proyecto

1.  **Construir y levantar los contenedores:**

    Abre una terminal en la raíz del proyecto y ejecuta el siguiente comando. Esto construirá la imagen de la aplicación web y creará los servicios de la base de datos y del servidor web.

    ```bash
    docker-compose up --build -d
    ```

2.  **Verificar que los contenedores están en ejecución:**

    ```bash
    docker-compose ps
    ```

    Deberías ver dos contenedores en estado "Up" o "running": `php_apache_web` y `mysql_db_people`.

3.  **Acceder a la API:**

    La API estará disponible en `http://localhost/~main/php/api.peopleapp.com/v1/`.

    Puedes usar los endpoints definidos en los archivos `.txt` del proyecto para interactuar con la API. Por ejemplo, para registrar un usuario, puedes hacer una petición POST a `http://localhost/~main/php/api.peopleapp.com/v1/usuarios/registro`.

## Endpoints de la API

Los endpoints principales son:

*   **Registro de usuario:** `POST /~main/php/api.peopleapp.com/v1/usuarios/registro`
*   **Login de usuario:** `POST /~main/php/api.peopleapp.com/v1/usuarios/login`
*   **Obtener contactos:** `GET /~main/php/api.peopleapp.com/v1/contactos`
*   **Obtener un contacto:** `GET /~main/php/api.peopleapp.com/v1/contactos/{id}`
*   **Crear contacto:** `POST /~main/php/api.peopleapp.com/v1/contactos`
*   **Actualizar contacto:** `PUT /~main/php/api.peopleapp.com/v1/contactos/{id}`
*   **Eliminar contacto:** `DELETE /~main/php/api.peopleapp.com/v1/contactos/{id}`

Recuerda incluir la `claveApi` en la cabecera `Authorization` para las rutas protegidas.

**Nota:** Puedes usar `http://127.0.0.1` o `http://localhost` indistintamente.

## Detener los contenedores

Para detener la aplicación, ejecuta:

```bash
docker-compose down
```
