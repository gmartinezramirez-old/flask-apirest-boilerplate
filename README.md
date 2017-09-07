# README

## Requeriments

This project uses:

* Python 3.6.0
* Flask 0.12.2
* Flask-REST-JSONAPI 0.12.6 
    * https://github.com/miLibris/flask-rest-jsonapi
* ORM: SQLAlchemy 2.2
    * https://github.com/zzzeek/sqlalchemy
* Flask-Excel 0.0.7
    * https://github.com/pyexcel-webwares/Flask-Excel
*

## Install

### Manual install

#### Using requeriments.txt

1.
2.
3.
4.

#### Manual

1.
2.
3.
4.

### Using Docker

1. 
2. 
3. 
4. 

## Usage

1.
2.
3.
4.


========================  ======  =============  ===========================
URL                       method  endpoint       Usage
========================  ======  =============  ===========================
/persons                  GET     person_list    Get a collection of persons
/persons                  POST    person_list    Create a person
/persons/<int:person_id>  GET     person_detail  Get person details
/persons/<int:person_id>  PATCH   person_detail  Update a person
/persons/<int:person_id>  DELETE  person_detail  Delete a person
========================  ======  =============  ===========================


### Petition on *nix os

* GET

with JSON:

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://hostname/resource

with XML:

curl -H "Accept: application/xml" -H "Content-Type: application/xml" -X GET http://hostname/resource


* POST

curl --data "param1=value1&param2=value2" http://hostname/resource

## Credits

Gonzalo Martinez Ramirez