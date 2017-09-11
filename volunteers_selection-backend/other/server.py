from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_restplus_patched import Api, Namespace, Resource, ModelSchema

__author__ = "Gonzalo Martinez Ramirez (gonzalo.martinez.ra@gmail.com)"
__version__ = "0.1.0"

# Extensions initialization
# ========================================
app = Flask(__name__)
db = SQLAlchemy(app)
#app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/test.db'
api = Api(app)


# Database table definition (SQLAlchemy)
# ========================================
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)

class Attribute(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)
    value = db.Column(db.Integer, nullable=False)

class Dimension(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)


# Serialization/Deserialization schema definition
# Reference: https://flask-marshmallow.readthedocs.io/en/latest/
class UserSchema(ModelSchema):
    class Meta:
        model = User

class AttributeSchema(ModelSchema):
    class Meta:
        model = Attribute


# "Users" resource RESTful API definitions
# ========================================
users_api = Namespace('users')
api.add_namespace(users_api)

@users_api.route('/')
class UsersList(Resource):

    @users_api.response(UserSchema(many=True))
    def get(self):
        return User.query.all()


@users_api.route('/<int:user_id>')
@users_api.resolve_object('user', lambda kwargs: User.query.get_or_404(kwargs.pop('user_id')))
class UserByID(Resource):

    @users_api.response(UserSchema())
    def get(self, user):
        return user


# "Attributes" resource RESTful API definitions
# ========================================
attributes_api = Namespace('attributes')
api.add_namespace(attributes_api)

@attributes_api.route('/')
class AttributesList(Resource):

    @attributes_api.response(UserSchema(many=True))
    def get(self):
        return Attribute.query.all()


@attributes_api.route('/<int:attribute_id>')
@attributes_api.resolve_object('attribute', lambda kwargs: Attributes.query.get_or_404(kwargs.pop('attribute_id')))
class AttributeByID(Resource):

    @attributes_api.response(AttributeSchema())
    def get(self, attribute):
        return attribute

# Run the RESTful API server
# ==========================
if __name__ == '__main__':
    db.create_all()
    with db.session.begin(nested=True):
        db.session.add(User(name='user1'))
        db.session.add(User(name='user2'))
    app.run()
