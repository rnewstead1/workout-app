import React, { useEffect, useState } from 'react';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from 'react-router-dom';

import Workout from './components/Workout';
import WorkoutsList from './components/WorkoutsList';
import WorkoutCreator from './components/WorkoutCreator';
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
          <ul>
            <li>
              <Link to="/">Workouts</Link>
            </li>
            <li>
              <Link to="/workouts">See all</Link>
            </li>
            <li>
              <Link to="/create">Create a workout</Link>
            </li>
          </ul>
          <div>
          </div>
        </div>
        <Switch>
          <Route exact path="/">
            <Home/>
          </Route>
          <Route path="/workouts">
            <WorkoutsList workouts={workouts}/>
          </Route>
          <Route path="/workout/:workoutId">
            <Workout/>
          </Route>
          <Route path="/create">
            <WorkoutCreator />
          </Route>
        </Switch>
      </div>
    </Router>
  );
}

function Home() {
  return (
    <div className="app-home">
      <p>A selection of workouts.</p>
      <p>Each will have 12 exercises.</p>
      <p>Install an <a href="https://play.google.com/store/apps/details?id=cc.dreamspark.intervaltimer&hl=en_GB&gl=US">interval timer app</a>.</p>
      <p>Set the time for 6 rounds of 50 seconds work, 10 seconds rest.</p>
      <p>Repeat each set 3 times.</p>
      <p>Take 2 minutes rest between each set.</p>
    </div>
  );
}
