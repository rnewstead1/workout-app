import React, { useEffect, useState } from 'react';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from 'react-router-dom';

import Workout from './components/Workout';
import WorkoutsList from './components/WorkoutsList';
import './App.scss';

export default function App() {
  const [workouts, setWorkouts] = useState([]);

  useEffect(() => {
    fetch('/api/workouts').then(res => res.json()).then(data => {
      setWorkouts(data.workouts);
    });
  }, []);

  return (
    <Router>
      <div className="app" data-testid="app">
        <div className="app-header">
          <h1>Workouts</h1>
          <ul>
            <li>
              <Link to="/workouts">View all</Link>
            </li>
          </ul>
        </div>

        <Switch>
          <Route path="/workouts">
            <WorkoutsList workouts={workouts} />
          </Route>
          <Route path="/workout/:workoutId">
            <Workout />
          </Route>
        </Switch>
      </div>
    </Router>
  );
}
