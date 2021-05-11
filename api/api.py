import os

from flask import abort, Flask, request
from flask_sqlalchemy import SQLAlchemy
from yoyo import read_migrations
from yoyo import get_backend
import logging

app = Flask(__name__)
app.logger.setLevel(logging.INFO)

SET_LENGTH = 6
NUMBER_OF_SETS = 2


def apply_db_migrations(db_uri):
    print("APPLYING DB MIGRATIONS")
    backend = get_backend(db_uri)
    migrations = read_migrations('./migrations')
    with backend.lock():
        # Apply any outstanding migrations
        backend.apply_migrations(backend.to_apply(migrations))


def create_models(db):
    global Exercise
    global Workout
    global WorkoutExercise

    class Exercise(db.Model):
        id = db.Column(db.Integer, primary_key=True)
        name = db.Column(db.String(244), unique=True, nullable=False)

        def __repr__(self):
            return '<Exercise %r>' % self.name

        @staticmethod
        def __as_dict(exercise):
            return {'name': getattr(exercise, 'name'), 'id': getattr(exercise, 'id')}

        @staticmethod
        def get_all():
            return [Exercise.__as_dict(exercise) for exercise in Exercise.query.all()]

        @staticmethod
        def get_by_id(exercise_id):
            return Exercise.query.filter_by(id=exercise_id).first()

    class Workout(db.Model):
        id = db.Column(db.Integer, primary_key=True)
        name = db.Column(db.String(244), unique=True, nullable=False)

        def __init__(self, name):
            self.name = name

        def __repr__(self):
            return '<Workout %r>' % self.name

        @staticmethod
        def __as_dict(workout):
            return {'name': getattr(workout, 'name'), 'id': getattr(workout, 'id')}

        @staticmethod
        def get_all():
            return [Workout.__as_dict(workout) for workout in Workout.query.all()]

        @staticmethod
        def get_by_id(workout_id):
            return Workout.query.filter_by(id=workout_id).first()

        def create(workout_name):
            workout = Workout(workout_name)
            db.session.add(workout)
            db.session.commit()
            app.logger.info(workout)

    class WorkoutExercise(db.Model):
        id = db.Column(db.Integer, primary_key=True)
        workout_id = db.Column(db.Integer, nullable=False)
        exercise_id = db.Column(db.Integer, nullable=False)
        exercise_position = db.Column(db.Integer, nullable=False)

        def __repr__(self):
            return '<Workout exercise %r>' % self.id

        @staticmethod
        def get_exercises(workout_id):
            return WorkoutExercise.query.filter_by(workout_id=workout_id).order_by(
                WorkoutExercise.exercise_position).all()


@app.before_first_request
def before_first_request():
    DB_FILE = os.environ.get('WORKOUT_DB') or 'workout_app.db'
    DB_URI = 'sqlite:///' + DB_FILE
    app.config['SQLALCHEMY_DATABASE_URI'] = DB_URI
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db = SQLAlchemy(app)
    create_models(db)
    apply_db_migrations(DB_URI)


@app.route('/api/workouts')
def get_workouts():
    return {'workouts': Workout.get_all()}


@app.route('/api/workout/<workout_id>')
def get_workout(workout_id):
    workout = Workout.get_by_id(workout_id)
    if workout is None:
        abort(404)
    name = workout.name
    workout_exercises = WorkoutExercise.get_exercises(workout_id)
    exercises = [{'exercise': Exercise.get_by_id(workout_exercise.exercise_id).name} for workout_exercise
                 in workout_exercises]

    sets = []
    for i in range(NUMBER_OF_SETS):
        start = i * SET_LENGTH
        end = start + SET_LENGTH
        sets.append(exercises[start:end])

    return {'name': name, 'sets': sets}

@app.route('/api/exercises')
def get_exercises():
    return {'exercises': Exercise.get_all()}

@app.route('/api/workout', methods=["POST"])
def create_workout():
    json = request.get_json()
    app.logger.info(json)
    Workout.create(json['title'])

    return {'created': 'ok'}