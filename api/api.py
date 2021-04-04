import time
from flask import Flask

app = Flask(__name__)

exercises = [
  {
    'name': 'Squats'
  },
  {
    'name': 'Press up walkouts'
  },
  {
    'name': 'Arabesque right leg'
  },
  {
    'name': 'Arabesque left leg'
  },
  {
    'name': 'Reverse plank leg raise'
  },
  {
    'name': 'Russian twists'
  }
]

@app.route('/api/exercises')
def get_exercises():
    return {'exercises': exercises}