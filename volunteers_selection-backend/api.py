from flask import Flask
from flask_restful import Api, Resource
#TODO: FIX ModuleNotFoundError: No module named 'flask_sqlalchemy'
#from flask_sqlalchemy import SQLAlchemy

from flask_sqlalchemy import SQLAlchemy

# Instantiate the app
app = Flask(__name__)
api = Api(app)

class TaskListAPI(Resource):
    def get(self):
        pass

    def post(self):
        pass

class TaskAPI(Resource):
    def get(self, id):
        pass

    def put(self, id):
        pass

    def delete(self, id):
        pass

api.add_resource(TaskListAPI, '/todo/api/v1.0/tasks', endpoint = 'tasks')
api.add_resource(TaskAPI, '/todo/api/v1.0/tasks/<int:id>', endpoint = 'task')

# Run the application
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)


