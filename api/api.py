from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from yoyo import read_migrations
from yoyo import get_backend

app = Flask(__name__)

DB_URI = 'sqlite:///workout_app.db'
app.config['SQLALCHEMY_DATABASE_URI'] = DB_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


def apply_db_migrations():
    print("APPLYING DB MIGRATIONS")
    backend = get_backend(DB_URI)
    migrations = read_migrations('./migrations')
    with backend.lock():
        # Apply any outstanding migrations
        backend.apply_migrations(backend.to_apply(migrations))


apply_db_migrations()


class Exercise(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(244), unique=True, nullable=False)

    def __repr__(self):
        return '<Exercise %r>' % self.name

    @staticmethod
    def __as_dict(exercise):
        return {'name': getattr(exercise, 'name')}

    @staticmethod
    def get_all():
        return [Exercise.__as_dict(exercise) for exercise in Exercise.query.all()]


class Workout(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(244), unique=True, nullable=False)

    def __repr__(self):
        return '<Workout %r>' % self.name


class WorkoutExercise(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    workout_id = db.Column(db.Integer, nullable=False)
    exercise_id = db.Column(db.Integer, nullable=False)
    exercise_position = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return '<Workout exercise %r>' % self.id


@app.route('/api/exercises')
def get_exercises():
    return {'exercises': Exercise.get_all() }