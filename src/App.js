import React, { useState, useEffect } from 'react';
import Workout from './components/Workout';

import './App.css';

function App() {
  const [exercises, setExercises] = useState([]);

  useEffect(() => {
    fetch('/api/exercises').then(res => res.json()).then(data => {
      setExercises(data.exercises);
    });
  }, []);

  return (
    <div className="App" data-testid="app">
      <Workout exercises={exercises}/>
    </div>
  );
}

export default App;
