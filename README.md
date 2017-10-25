Waynakay back end
=================

* Por defecto el servidor API REST queda en localhost:8082
* Probado en:
    * OS: Ubuntu 16.04 y SolusOS 3. Linux Kernel: 4.13.5-24.current
    * Docker version 17.03.1-ce
    * Docker-compose version 1.14.0
* Construido usando:
  * Python 2.7.3
  * Flask

----------


Requerimientos
--------------

* Docker
* Docker-compose


----------


## Instrucciones de instalacion Docker

### Distribuciones *nix

#### Instalación Docker

* Referencia: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04


#### Instalación Docker-compose

* Referencia: https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04

```bash
$ sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```

```bash
$ sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```

### MacOS

* Guía instalación pestaña MacOS: https://docs.docker.com/docker-for-mac/install/

# Instalación

```bash
$ docker-compose build
```

![Instalación](docs/waynakay-build.gif?raw=true "Docker-compose build")


----------


# Ejecución

1. Situarse en la carpeta raíz del proyecto donde se encuentra el archivo docker-compose.yml, y ejecutar desde la terminal: "docker-compose run" para levantar la aplicación.

```bash
$ docker-compose up
```

2. Para verificar si esta funcionando, visitar http://localhost:8082/api/v1
3. Para terminar la ejecución, presionar Ctrl-C.

![Ejecución](docs/waynakay-up.gif?raw=true "Docker-compose up")

----------

# Ejemplos

* Los siguientes ejemplos hacen uso de Curl, las peticiones se hacen a localhost:8082.

```bash
$ curl "localhost:8082/api/v1/info"
```

## GET

* url: localhost:8082/voluntarios
* Ejemplo:

```bash
$ curl -i -H "Accept: application/json" "localhost:8082/endpoint"
```

* Obtener la lista de atributos

```bash
$ curl -i -H "Accept: application/json" "localhost:8082/attributes"
```

## POST

* Ejemplo:

```bash
$ curl -d '{"campo": dato}' -H "Content-Type: application/json" http://localhost:8082/endpoint
```

* Insertar un nuevo criterio mediante el nombre del criterio

```bash
$ curl -d '{"name":"nombre criterio", "value": 20}' -H "Content-Type: application/json" -X POST http://localhost:8082/setCriterion
```

* Insertar un nuevo atributo mediante el nombre del atributo

```bash
$ curl -d '{"name":"nombre atributo"}' -H "Content-Type: application/json" http://localhost:8082/setAttribute
```

----------

# Uso

| Resource                        | GET                   | POST                       | Example
|:-----------------------------------:|:---------------------:|:--------------------------:|---------
| /api/v1/                        | Hello World           |    -     				   | -
| /api/v1/criterions              | List of criterions    | Create a new criterion     | -
| /api/v1/criterion/<int:id>      | Show criterion        |    -     				   |
| /api/v1/attributes              | List of attributes    | Create a new attribute     | -
| /api/v1/announcements           | List of announcements | Create a new announcement  | -
| /api/v1/announcements/<int:id>  | Show announcement     |    -     			       | -
| /api/v1/templates               | List of templates     | Create a new template      | -
| /api/v1/templates/<int:id>      | Show specific template| Treat as a collection create new template in it                          |
| api/v1/templates/<int:id>/criterions/value      | List value of criterion given announcement ID| Treat as a collection create new template in it                          |
| /api/v1/templates/<int:id>/criterions  | List of criterions associated to a template given template id| Treat as a collection create new template
| /api/v1/templates/<int:id>/criterions/attributes| List of attributes of a criterion associated by template given template id    | -                     | -
| /api/v1/volunteers              | List of volunteers    | -                     | -
| /api/v1/status                  | Get status            | -    | -


* Para los POST se necesita pasarle un json con cierta informacion, adjunto el comando CURL con ejemplo

* POST:
	* Agrega un template (o relaciona) con criterios a una convocatoria dado el id de la convocatoria.
	* Informacion necesaria: info de template, convocatoria y criterio
		* template_name
		* title
		* required
		* selected
		* createdAt
		* description
		* template_id
		* criterion_name
		* criterion_value
	* /api/v1/announcements/<int:id>/templates/criterions
	* curl -i -H "Content-Type: application/json" -X POST -d '{"template_name":"templatenuevo1", "title":"Nuevo", "required": 20, "selected": 10, "createdAt":2017, "description": "descripcion", "template_id": 1, "criterion_name": "C1nuevo2017", "criterion_value":15}' http://localhost:8082/api/v1/announcements/1/templates/criterions

* GET: /api/v1/templates/<int:id>/criterions/attributes
	* Obtiene la configuracion de la lista de criterios con su categoria (sin clasificar, deseable o no deseable), atributo original y nombre de atributos
	* [{"category": "Criterio 1", "attributes": [{"original_attribute": "o1", "name": "a1"}, {"original_attribute": "o2", "name": "Operacion"}, {"original_attribute": "o4", "name": "Medicamento contradictorio"}]}, {"category": "Criterio 2", "attributes": [{"original_attribute": "o3", "name": "Otra enfermedad"}, {"original_attribute": "o3", "name": "Participaciones previas"}, {"original_attribute": "o4", "name": "Medicamento contradictorio"}]}]
	* Donde criterio es el nombre del criterio, que tambien puede ser sin clasificar, indeseable y deseable.

* GET: /api/v1/announcements/<int:id>/templates
	* Obtiene la plantilla asociadas a las convocatorias.
	* [{"id": 1, "name": "t1"}]

* GET: /api/v1/announcements/<int:id>/templates/criterions
	* Gráfico radar/araña
	* Obtiene los criterios asociados a la plantilla asociada a una convocatoria dada su id.
	* [{"name": "c1", "value": 1}, {"name": "Criterio 2", "value": 10}]

* GET: /api/v1/announcements/<int:id>/templates/criterions/attributes
	* Obtiene la lista de atributos asociados al criterio, asociado a una convocatoria dada su id.
	* [{"name": "a1"}, {"name": "Operacion"}, {"name": "Medicamento contradictorio"}, {"name": "Otra enfermedad"}, {"name": "Participaciones previas"}, {"name": "Medicamento contradictorio"}]

* GET: /api/v1/announcements/<int:id>/templates/attributes
	* [{"name": "a1"}, {"name": "Operacion"}, {"name": "Medicamento contradictorio"}]

* GET: /api/v1/originalattributes/<int:id>/attributes
	* Obtiene los atributos de cada atributo original, obtiene el id del atributo y el nombre del atributo asociado.
	* [{"id": 1, "name": "a1"}, {"id": 2, "name": "Problema respiratorio"}]

* GET: /api/v1/announcements/<int:id>/templates
	* Obtiene los templates de cada convocatoria, id del template, nombre del template: [{"id": 1, "name": "t1"}]

* GET: /api/v1/templates/<int:id>/criterions/attributes
	* Obtiene nombre del criterio, nombre del atributo, nombre del atributo original: [{"criterion": "c1", "attribute": "a1", "original": "o1"}]

* GET: /api/v1/originalattributes
	* Obtiene la lista de los atributos originales con su id.
	* [{"id": 1, "name": "o1"}, {"id": 2, "name": "o2"}, {"id": 3, "name": "o3"}, {"id": 4, "name": "o4"}]

# Modelo de BD

![BD](docs/database_model.png?raw=true "BD")


# Acceder a PHPMyAdmin

* localhost:80
* user: root
* pass: citiaps2017

# TODO

* [X] Actualizar readme con las nuevas rutas (18 oct)
* [] Probar con test unitarios.
* [] Leer y crear objetos en la BD a partir de archivos CSV, XLSX, etc (Por ahora no).
* [] Limitar las peticiones.
* [] Crear status response.
* [] En tabla announcement, cambiar atributo createAt a tipo big int, para solucionar el error: Please enter a value less than or equal to 2147483647
