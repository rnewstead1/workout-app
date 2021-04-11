from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from yoyo import read_migrations
from yoyo import get_backend

app = Flask(__name__)

DB_URI = 'sqlite:///workout_app.db'
app.config['SQLALCHEMY_DATABASE_URI'] = DB_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

SET_LENGTH = 6
NUMBER_OF_SETS = 2


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

    @staticmethod
    def get_by_id(exercise_id):
        return Exercise.query.filter_by(id=exercise_id).first()


class Workout(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(244), unique=True, nullable=False)

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


class WorkoutExercise(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    workout_id = db.Column(db.Integer, nullable=False)
    exercise_id = db.Column(db.Integer, nullable=False)
    exercise_position = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return '<Workout exercise %r>' % self.id

    @staticmethod
    def get_exercises(workout_id):
        return WorkoutExercise.query.filter_by(workout_id=workout_id).order_by(WorkoutExercise.exercise_position).all()


@app.route('/api/workouts')
def get_workouts():
    return {'workouts': Workout.get_all()}


@app.route('/api/workout/<workout_id>')
def get_workout(workout_id):
    name = Workout.get_by_id(workout_id).name
    exercise_ids = WorkoutExercise.get_exercises(workout_id)
    exercises = [{'exercise': Exercise.get_by_id(exercise.id).name} for exercise
                 in exercise_ids]

    sets = []
    for i in range(NUMBER_OF_SETS):
        start = i * SET_LENGTH
        end = start + SET_LENGTH
        sets.append(exercises[start:end])

    return {'name': name, 'sets': sets}
