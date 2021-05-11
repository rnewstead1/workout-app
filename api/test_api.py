import os
import api


def test_get_workouts(tmp_path):
    test_db = tmp_path / 'test.db'
    os.environ['WORKOUT_DB'] = str(test_db)
    app = api.app.test_client()
    api.before_first_request()
    response = app.get('/api/workouts')
    assert response.status == "200 OK"
    assert response.json ==  {'workouts': [{'id': 1, 'name': 'Basic'}, {'id': 2, 'name': 'Core'}, {'id': 3, 'name': 'Legs'}]}


def test_create_workout(tmp_path):
    test_db = tmp_path / 'test.db'
    print(test_db)
    os.environ['WORKOUT_DB'] = str(test_db)
    app = api.app.test_client()
    api.before_first_request()
    response = app.post('/api/workout', json={"title":"morning","exercises":{"1":True,"2":True}})
    print(response.json)
    assert response.status == "200 OK"
