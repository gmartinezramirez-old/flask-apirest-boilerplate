from flask import Flask
from flask import request, jsonify, json
from model import db
from model import Criterion
from model import Attribute
from model import Template
from model import Announcement
from model import Volunteer
from model import Originalattribute

from model import CreateDB
from model import app as application
import simplejson as json
from sqlalchemy.exc import IntegrityError
from sqlalchemy.sql.expression import func, select
# testing
#from sqlalchemy.sql.functions import func
from flask_cors import CORS
from numpy import genfromtxt
from time import time
from datetime import datetime
import random
import os
import csv

app = Flask(__name__)
CORS(app)


@app.route('/api/v1')
def index():
    return 'Welcome to Waynakay API REST\n'


@app.route('/api/v1/criterions', methods=['GET', 'POST'])
def criterion():
    if request.method == 'GET':
        """ List criterions """
        try:
            criterions = Criterion.query.all()
            response = []
            for criterion in criterions:
                response.append({
                    'id': criterion.id,
                    'name': criterion.name,
                    'value': criterion.value
                })

            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})

    else:
        #curl -i -H "Content-Type: application/json" -X POST -d '{"name":"Nuevo", "value": 20, "template_id": 1}' http://localhost:8082/api/v1/criterions
        """ Create a new criterion """
        try:
            values = request.get_json()
            name = values['name']
            value = values['value']
            template_id = values['template_id']
            #return json.dumps(values)
            criterion = Criterion(name, value, template_id)
            db.session.add(criterion)
            db.session.commit()
            return json.dumps({'status': True})
        except IntegrityError:
            return json.dumps({'status': False})


@app.route('/api/v1/criterions/<int:id>', methods=['GET'])
def criterionById(id):
    if request.method == 'GET':
        """ Show criterion """
        try:
            criterion = Criterion.query.filter_by(id=id).first_or_404()
            return json.dumps({'id': criterion.id,
                               'name': criterion.name,
                               'value': criterion.value
                               })
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/attributes', methods=['GET', 'POST'])
def attributes():
    if request.method == 'GET':
        """ List attributes """
        try:
            attributes = Attribute.query.all()
            response = []
            for attribute in attributes:
                response.append({
                    'id': attribute.id,
                    'name': attribute.name
                })

            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})
    else:
        """ Create a new attribute"""
        try:
            values = request.get_json()
            name = values['name']
            attribute = Attribute(name)
            db.session.add(attribute)
            db.session.commit()
            return json.dumps({'status': True})
        except IntegrityError:
            return json.dumps({'status': False})


@app.route('/api/v1/attributes/<int:id>', methods=['GET'])
def attributesById(id):
    if request.method == 'GET':
        """ Show announcement """
        try:
            attribute = Attribute.query.filter_by(id=id).first_or_404()
            return json.dumps({'id': attribute.id,
                               'name': attribute.name
                               })
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/originalattributes', methods=['GET', 'POST'])
def originalAttributes():
    if request.method == 'GET':
        """ List of original attributes """
        try:
            OriginalAttributes = Originalattribute.query.all()
            response = []
            for originalAttribute in OriginalAttributes:
                response.append({
                    'id': originalAttribute.id,
                    'name': originalAttribute.name
                })

            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})
    else:
        """ Create a new attribute"""
        try:
            values = request.get_json()
            #name = request.get['name']
            #attribute = Attribute(name)
            name = values['name']
            attribute = Attribute(name)
            db.session.add(attribute)
            db.session.commit()
            return json.dumps({'status': True})
        except IntegrityError:
            return json.dumps({'status': False})


@app.route('/api/v1/originalattributes/<int:id>', methods=['GET'])
def originalAttributeById(id):
    if request.method == 'GET':
        """ Show specific original attribute """
        try:
            originalattribute = Originalattribute.query.filter_by(id=id).first_or_404()
            return json.dumps({'id': originalattribute.id,
                               'name': originalattribute.name
                               })
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/originalattributes/<int:id>/attributes', methods=['GET'])
def attributesOfOriginalAttribute(id):
    if request.method == 'GET':
        """ Show attributes of a original attribute given a original attribute id """
        try:
            response = []
            listAttributeId = []
            listAttributesInfo = []
            originalAttribute = Originalattribute.query.filter_by(id=id).first_or_404()
            for attribute in originalAttribute.attributes:
                response.append({'id': attribute.id, 'name': attribute.name})
            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/announcements', methods=['GET', 'POST'])
def announcements():
    if request.method == 'GET':
        """ List announcements """
        try:
            announcements = Announcement.query.all()
            response = []
            for announcement in announcements:
                response.append({
                    'id': announcement.id,
                    'title': announcement.title,
                    'required': announcement.required,
                    'selected': announcement.selected,
                    'createdAt': announcement.createdAt,
                    'description': announcement.description
                })
            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})
    else:
        """ Create new announcement """
        try:
            #title = request.get['title']
            #required = request.get['required']
            #selected = request.get['selected']
            #createdAt = request.get['createdAt']
            #description = request.get['description']
            values = request.get_json()
            title = values['title']
            required = values['required']
            selected = values['selected']
            createdAt = values['createdAt']
            description = values['description']
            template_id = values['template_id']
            announcement = Announcement(title, required, selected, createdAt, description, template_id)
            db.session.add(announcement)
            db.session.commit()
            return json.dumps({'status': True})
        except IntegrityError:
            return json.dumps({'status': False})


@app.route('/api/v1/announcements/<int:id>', methods=['GET'])
def announcementsById(id):
    if request.method == 'GET':
        """ Show announcement """
        try:
            announcement = Announcement.query.filter_by(id=id).first_or_404()
            return json.dumps({'id': announcement.id,
                               'required': announcement.required,
                               'selected': announcement.selected,
                               'createdAt': announcement.createdAt,
                               'description': announcement.description,
                               })
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/announcements/<int:id>/templates', methods=['GET'])
def announcementsTemplateById(id):
    if request.method == 'GET':
        try:
            response = []
            listTemplatesId = []
            announcement = Announcement.query.filter_by(id=id).first_or_404()
            response.append({
                'id': announcement.template.id,
                'name': announcement.template.name
            })

            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})


# Grafico spider/radar
#curl -i -H "Content-Type: application/json" -X POST -d '{"template_name":"templatenuevo1", "title":"Nuevo", "required": 20, "selected": 10, "createdAt":2017, "description": "descripcion", "template_id": 1, "criterion_name": "C1nuevo2017", "criterion_value":15}' http://localhost:8082/api/v1/announcements/1/templates/criterions

@app.route('/api/v1/announcements/<int:id>/templates/criterions', methods=['GET', 'POST'])
def RelevancyCriterion(id):
    if request.method == 'GET':
        try:
            response = []
            listOfCriterions = []
            announcement = Announcement.query.filter_by(id=id).first_or_404()
            for criterion in announcement.template.criterions:
                response.append({'name': criterion.name, 'value': criterion.value})

            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})
    else:
        """ Asociar criterios a una convocatoria """

        try:
            ## Announcement obj
            #title = request.get['title']
            #required = request.get['required']
            #selected = request.get['selected']
            #createdAt = request.get['createdAt']
            #description = request.get['description']

            ## Announcement obj
            values = request.get_json()
            template_id = values['template_id']
            #return json.dumps(values)
            #announcement = Announcement.query.filter_by(id=id).first_or_404()

            # Criterion obj
            #criterion_name = request.get['criterion_name']
            #criterion_value = request.get['criterion_value']
            #template_id = request.get['template_id']

            criterion_name = values['criterion_name']
            criterion_value = values['criterion_value']

            # Criterion obj
            #criterion_name = request.get['criterion_name']
            #criterion_value = request.get['criterion_value']
            #template_id = request.get['template_id']
            criterion = Criterion(criterion_name, criterion_value, template_id)

            title = values['title']
            required = values['required']
            selected = values['selected']
            createdAt = values['createdAt']
            description = values['description']

            #announcement = Announcement(title, required, selected, createdAt, description, template_id)
            announcement = Announcement(title, required, selected, createdAt, description, template_id)

            # Template obj
            template_name = values['template_name']
            template = Template(template_name, criterions=[criterion])

            #announcement.template.append(template)
            #announcement.template.criterions.append(criterion)

            db.session.add(template)
            db.session.add(announcement)
            db.session.add(criterion)
            db.session.commit()
            return json.dumps({'status': True})
        except IntegrityError:
            return json.dumps({'status': False})

#https://stackoverflow.com/questions/16433338/inserting-new-records-with-one-to-many-relationship-in-flask-sqlalchemy
# Random reference: https://stackoverflow.com/questions/60805/getting-random-row-through-sqlalchemy/14906244


@app.route('/api/v1/announcements/<int:id>/templates/criterions/attributes', methods=['GET'])
def attributesOfCriterionsAnnouncement(id):
    if request.method == 'GET':
        try:
            response = []
            listOfCriterions = []
            announcement = Announcement.query.filter_by(id=id).first_or_404()
            for criterion in announcement.template.criterions:
                for attribute in criterion.attributes:
                    response.append({'name': attribute.name})

            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/announcements/<int:id>/templates/attributes', methods=['GET'])
def attributesOfTemplateAnnouncement(id):
    if request.method == 'GET':
        try:
            response = []
            listOfCriterions = []
            announcement = Announcement.query.filter_by(id=id).first_or_404()
            for attribute in announcement.template.attributes:
                response.append({'name': attribute.name})

            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/templates', methods=['GET', 'POST'])
def templates():
    if request.method == 'GET':
        """ List templates """
        try:
            response = []
            templates = Template.query.all()
            for template in templates:
                response.append({
                    'id': template.id,
                    'name': template.name
                })
            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})
    else:
        try:
            values = request.get_json()
            name = values['name']
            template = Template(name)
            db.session.add(template)
            db.session.commit()
            return json.dumps({'status': True})
        except IntegrityError:
            return json.dumps({'status': False})


@app.route('/api/v1/templates/<int:id>', methods=['GET'])
def templatesByID(id):
    if request.method == 'GET':
        """ Show specific template """
        try:
            template = Template.query.filter_by(id=id).first_or_404()
            return json.dumps({'id': template.id,
                               'name': template.name
                               })
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/templates/<int:id>/criterions', methods=['GET'])
def criterionsOfTemplatesByID(id):
    if request.method == 'GET':
        """ Show specific name and id criterions associated to a template id """
        try:
            response = []
            listCriterionsId = []
            template = Template.query.filter_by(id=id).first_or_404()

            for t in template.criterions:
                listCriterionsId.append(t.id)

            for c in range(len(listCriterionsId)):
                criterion = template.criterions[c]
                response.append({'id': criterion.id, 'name': criterion.name, 'value': criterion.value})

            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/templates/<int:id>/criterions/attributes', methods=['GET'])
def attributesOfTemplatesByID(id):
    if request.method == 'GET':
        """ Show specific info of attributes asociated to the criterions of a template """
        try:
            response = []
            listCriterionsId = []
            dicCriterionName = {}
            dicCriterion = {}
            dicAttributes = {}
            listTemp = []
            template = Template.query.filter_by(id=id).first_or_404()

            for t in template.criterions:
                listCriterionsId.append(t.id)

            lenTemplateCriterions = len(listCriterionsId)

            for criterio in range(lenTemplateCriterions):
                criterion = template.criterions[criterio]
                criterionName = criterion.name
                dicCriterion["category"] = criterionName
                for attr in criterion.attributes:
                    dicAttributes["name"] =  attr.name
                    dicAttributes["original_attribute"] = attr.originalattribute.name
                    listTemp.append(dicAttributes)
                    dicAttributes = {}
                dicCriterion["attributes"] = listTemp
                response.append(dicCriterion)
                listTemp = []
                dicCriterion = {}
            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/templates/<int:id>/criterions/attributes/originalattributes', methods=['GET'])
def originalAttributesOfAttributesOfTemplatesByID(id):
    if request.method == 'GET':
        try:
            response = []
            listCriterionsId = []
            listAttributes = []
            listOriginalAttribute = []
            template = Template.query.filter_by(id=id).first_or_404()

            for t in template.criterions:
                listCriterionsId.append(t.id)

            lenTemplateCriterions = len(listCriterionsId)

            for c in range(lenTemplateCriterions):
                criterion = template.criterions[c]
                for attr in criterion.attributes:
                    response.append({'criterion': criterion.name, 'originalattribute': attr.originalattribute.name})
            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/volunteers', methods=['GET', 'POST'])
def volunteers():
    if request.method == 'GET':
        """ List volunteers """
        try:
            response = []
            volunteers = Volunteer.query.all()
            for volunteer in volunteers:
                response.append({
                    'id': volunteer.id
                })
            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/volunteers/selection', methods=['GET', 'POST'])
def volunteersRandomSelection():
    if request.method == 'GET':
        """ List volunteers """
        try:
            #rand = random.randrange(0, session.query(Volunteer).count())
            #row = session.query(Volunteer)[rand]

            response = []
            #number = session.query(func.count(Volunteer.id).label('number').first().number
            maxQuantity = 200
            randomSelectionQuantity = random.randint(2,maxQuantity)
            #volunteers = Volunteer.query.all()
            #for volunteer in row:
            #    responseTest.append({
            #        'id': volunteer.id
            #    })
            #total = len(responseTest)
            response.append({'total': maxQuantity})
            return json.dumps(response)
        except IntegrityError:
            return json.dumps({})


@app.route('/api/v1/status')
def app_status():
    return json.dumps({'server_info': application.config['SQLALCHEMY_DATABASE_URI']})


@app.route('/api/v1/createtbl')
def createTables():
    try:
        db.create_all()
        return json.dumps({'status': True})
    except IntegrityError:
        return json.dumps({'status': False})


# run app service
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8082, debug=True)
