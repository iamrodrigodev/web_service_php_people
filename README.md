<div align="center">
<table>
    <thead>
        <tr>
            <th>
                <img src="https://github.com/RodrigoStranger/imagenes-la-salle/blob/main/logo_secundario_color.png?raw=true" width="150"/>
            </th>
            <th>
                <span style="font-weight:bold;">UNIVERSIDAD LA SALLE DE AREQUIPA</span><br />
                <span style="font-weight:bold;">FACULTAD DE INGENIERÍAS Y ARQUITECTURA</span><br />
                <span style="font-weight:bold;">DEPARTAMENTO ACADEMICO DE INGENIERÍA Y MATEMÁTICAS</span><br />
                <span style="font-weight:bold;">CARRERA PROFESIONAL DE INGENIERÍA DE SOFTWARE</span>
            </th>            
        </tr>
    </thead>
</table>
</div>

<div align="center">
  <h2 style="font-weight:bold;">INGENIERÍA WEB</h2>
</div>

<div align="center">
<table>
    <thead>
        <tr>
            <th><strong>Semestre</strong></th>
            <th><strong>Profesor</strong></th>
            <th><strong>Créditos</strong></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="center">2025 II</td>
            <td align="center">Richart Smith Escobedo Quispe</td>
            <td align="center">4</td>
        </tr>
    </tbody>
</table>
</div>

## Web service php people

## Tecnologías utilizadas

[![PHP][PHP]][php-site]
[![MySQL][MySQL]][mysql-site]
[![Docker][Docker]][docker-site]
[![Apache2][Apache2]][apache2-site]
[![Postman][Postman]][postman-site]
[![Git][Git]][git-site]
[![GitHub][GitHub]][github-site]

## Requisitos

*   Docker
*   Docker Compose
*   Cliente HTTP (Postman, Thunder Client, Insomnia, etc.)

[PHP]: https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white
[php-site]: https://www.php.net/

[MySQL]: https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white
[mysql-site]: https://www.mysql.com/

[Docker]: https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white
[docker-site]: https://www.docker.com/

[Apache2]: https://img.shields.io/badge/Apache%202-D22128?style=for-the-badge&logo=apache&logoColor=white
[apache2-site]: https://httpd.apache.org/

[Postman]: https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white
[postman-site]: https://www.postman.com/

[Git]: https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white
[git-site]: https://git-scm.com/

[GitHub]: https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white
[github-site]: https://github.com/

## Cómo ejecutar el proyecto

1.  **Construir y levantar los contenedores:**

    ```bash
    docker-compose up --build -d
    ```

2.  **Verificar que los contenedores están en ejecución:**

    ```bash
    docker-compose ps
    ```

3.  **Acceder a la API:**

    La API estará disponible en `http://localhost/~main/php/api.peopleapp.com/v1/`

## Detener los contenedores

Para detener la aplicación, ejecuta:

```bash
docker-compose down
```

---

## Documentación de Endpoints

**URL Base:** `http://127.0.0.1/~main/php/api.peopleapp.com/v1/`

### 1. Registro de Usuario

Crea un nuevo usuario en el sistema.

**Endpoint:** `POST /usuarios/registro`

**URL Completa:** `http://127.0.0.1/~main/php/api.peopleapp.com/v1/usuarios/registro`

**Body (JSON):**
```json
{
    "nombre": "Anastasia Bell",
    "contrasena": "TSM03HVY4VO",
    "correo": "anastasiabell@icloud.org"
}
```

**Respuesta exitosa:**
```json
{
    "estado": 1,
    "mensaje": "¡Registro con éxito!"
}
```

---

### 2. Login de Usuario

Autentica un usuario y devuelve su información incluyendo la `claveApi`.

**Endpoint:** `POST /usuarios/login`

**URL Completa:** `http://127.0.0.1/~main/php/api.peopleapp.com/v1/usuarios/login`

**Body (JSON):**
```json
{
    "correo": "anastasiabell@icloud.org",
    "contrasena": "TSM03HVY4VO"
}
```

**Respuesta exitosa:**
```json
{
    "estado": 1,
    "usuario": {
        "nombre": "Anastasia Bell",
        "correo": "anastasiabell@icloud.org",
        "claveApi": "abc123def456789..."
    }
}
```

**Nota:** Guarda la `claveApi` para usarla en los siguientes endpoints.

---

### 3. Obtener Todos los Contactos

Obtiene la lista de todos los contactos del usuario autenticado.

**Endpoint:** `GET /contactos`

**URL Completa:** `http://127.0.0.1/~main/php/api.peopleapp.com/v1/contactos`

**Headers:**
```
Authorization: tu_claveApi_aqui
```

**Respuesta exitosa:**
```json
{
    "estado": 1,
    "datos": [
        {
            "idContacto": "1",
            "primerNombre": "Juan",
            "primerApellido": "Pérez",
            "telefono": "555-1234",
            "correo": "juan@example.com",
            "idUsuario": "1"
        }
    ]
}
```

---

### 4. Obtener un Contacto Específico

Obtiene la información de un contacto por su ID.

**Endpoint:** `GET /contactos/{id}`

**URL Completa:** `http://127.0.0.1/~main/php/api.peopleapp.com/v1/contactos/1`

**Headers:**
```
Authorization: tu_claveApi_aqui
```

**Respuesta exitosa:**
```json
{
    "estado": 1,
    "datos": [
        {
            "idContacto": "1",
            "primerNombre": "Juan",
            "primerApellido": "Pérez",
            "telefono": "555-1234",
            "correo": "juan@example.com",
            "idUsuario": "1"
        }
    ]
}
```

---

### 5. Crear un Contacto

Crea un nuevo contacto asociado al usuario autenticado.

**Endpoint:** `POST /contactos`

**URL Completa:** `http://127.0.0.1/~main/php/api.peopleapp.com/v1/contactos`

**Headers:**
```
Authorization: tu_claveApi_aqui
```

**Body (JSON):**
```json
{
    "primerNombre": "Juan",
    "primerApellido": "Pérez",
    "telefono": "555-1234",
    "correo": "juan@example.com"
}
```

**Respuesta exitosa:**
```json
{
    "estado": 1,
    "mensaje": "Contacto creado",
    "id": "1"
}
```

---

### 6. Actualizar un Contacto

Actualiza la información de un contacto existente.

**Endpoint:** `PUT /contactos/{id}`

**URL Completa:** `http://127.0.0.1/~main/php/api.peopleapp.com/v1/contactos/1`

**Headers:**
```
Authorization: tu_claveApi_aqui
```

**Body (JSON):**
```json
{
    "primerNombre": "Juan Carlos",
    "primerApellido": "Pérez García",
    "telefono": "555-5678",
    "correo": "juancarlos@example.com"
}
```

**Respuesta exitosa:**
```json
{
    "estado": 1,
    "mensaje": "Registro actualizado correctamente"
}
```

---

### 7. Eliminar un Contacto

Elimina un contacto del sistema.

**Endpoint:** `DELETE /contactos/{id}`

**URL Completa:** `http://127.0.0.1/~main/php/api.peopleapp.com/v1/contactos/1`

**Headers:**
```
Authorization: tu_claveApi_aqui
```

**Respuesta exitosa:**
```json
{
    "estado": 1,
    "mensaje": "Registro eliminado correctamente"
}
```

---

## Notas Importantes

- Todos los endpoints de contactos requieren autenticación mediante la cabecera `Authorization` con la `claveApi`.
- Puedes usar `http://127.0.0.1` o `http://localhost` indistintamente.
- Los endpoints de registro y login no requieren autenticación.
- El formato de respuesta por defecto es JSON, pero puedes agregar `?formato=xml` para obtener respuestas en XML.