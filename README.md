# README

## Dependencies

### Project Dependencies

* [**Python**](https://www.python.org/) 2.7, 3.3+ / pypy2 (2.5.0)
* [**flask-restplus**](https://github.com/noirbizarre/flask-restplus) (+
  [*flask*](http://flask.pocoo.org/))
* [**sqlalchemy**](http://www.sqlalchemy.org/) (+
  [*flask-sqlalchemy*](http://flask-sqlalchemy.pocoo.org/)) - Database ORM.
* [**sqlalchemy-utils**](https://sqlalchemy-utils.rtdf.org/) - for nice
  custom fields (e.g., `PasswordField`).
* [**alembic**](https://alembic.rtdf.org/) - for DB migrations.
* [**marshmallow**](http://marshmallow.rtfd.org/) (+
  [*marshmallow-sqlalchemy*](http://marshmallow-sqlalchemy.rtfd.org/),
  [*flask-marshmallow*](http://flask-marshmallow.rtfd.org/)) - for
  schema definitions. (*supported by the patched Flask-RESTplus*)
* [**webargs**](http://webargs.rtfd.org/) - for parameters (input arguments).
  (*supported by the patched Flask-RESTplus*)
* [**apispec**](http://apispec.rtfd.org/) - for *marshmallow* and *webargs*
  introspection. (*integrated into the patched Flask-RESTplus*)
* [**oauthlib**](http://oauthlib.rtfd.org/) (+
  [*flask-oauthlib*](http://flask-oauthlib.rtfd.org/)) - for authentication.
* [**flask-login**](http://flask-login.rtfd.org/) - for `current_user`
  integration only.
* [**bcrypt**](https://github.com/pyca/bcrypt/) - for password hashing (used as
  a backend by *sqlalchemy-utils.PasswordField*).
* [**permission**](https://github.com/hustlzp/permission) - for authorization.
* [**Swagger-UI**](https://github.com/swagger-api/swagger-ui) - for interactive
  RESTful API documentation.


## Installation

### Using Docker

```bash
$ docker run -it --rm --publish 5000:5000 frolvlad/flask-restplus-server-example
```

### Using Dockercompose

```bash
$ docker-compose up 
```

### From sources



#### Using requirements.txt

```bash
$ pip install -r app/requirements.txt
$ python server.py
```
## Usage

Open http://127.0.0.1:5000 and examine the interactive documentation for this
new RESTful API server! You can use any HTTP tools (e.g. `cURL`, `wget`,
Python `requests`, or just a web browser) to communicate with it, or generate
specialized API client libraries for many programming languages using
[Swagger Codegen](https://github.com/swagger-api/swagger-codegen)


| URL                            | Method | Endpoint         | Usage                          |
| ------------------------------ | ------ | ---------------- |------------------------------- | 
| /attributes                    | GET    | attributes_list  | Get a collection of attributes |
| /attributes                    | POST   | attributes_list  | Create a attribute             |
| /dimensions                    | GET    | dimensions_list  | Get a collection of dimensions |
| /dimensions                    | POST   | dimensions_list  | Create a dimension             |
| /attributes/<int:attribute_id> | GET    | attribute_detail | Get attribute detail           |
| /attributes/<int:attribute_id> | GET    | attribute_detail | Get attribute detail           |



### Petition on *nix os

* GET

with JSON:

```bash
$ curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://hostname/resource
```

with XML:

```bash
$ curl -H "Accept: application/xml" -H "Content-Type: application/xml" -X GET http://hostname/resource
```

* POST

```bash
curl --data "param1=value1&param2=value2" http://hostname/resource
```

### Application Structure

```
app/
├── requirements.txt
├── __init__.py
├── extensions
│   └── __init__.py
└── modules
    ├── __init__.py
    ├── api
    │   └── __init__.py
    ├── auth
    │   ├── __init__.py
    │   ├── models.py
    │   ├── parameters.py
    │   └── views.py
    ├── users
    │   ├── __init__.py
    │   ├── models.py
    │   ├── parameters.py
    │   ├── permissions.py
    │   ├── resources.py
    │   └── schemas.py
    └── teams
        ├── __init__.py
        ├── models.py
        ├── parameters.py
        ├── resources.py
        └── schemas.py
```

* `app/requirements.txt` - The list of Python (PyPi) requirements.
* `app/__init__.py` - The entrypoint to this RESTful API Server example
  application (Flask application is created here).
* `app/extensions` - All extensions (e.g. SQLAlchemy, OAuth2) are initialized
  here and can be used in the application by importing as, for example,
  `from app.extensions import db`.
* `app/modules` - All endpoints are expected to be implemented here in logicaly
  separated modules. It is up to you how to draw the line to separate concerns
  (e.g. you can implement a monolith `blog` module, or split it into
  `topics`+`comments` modules).


## Issues

If you run docker-compose up -d, you need to run docker-compose stop to stop the services when you finish. If you did not, you can stop the service with CTRL+C (hit once to gracefully stop and twice to force kill the containers). If you do not run in the background, you can view the calls made to your container.

## Credits

Gonzalo Martinez Ramirez
