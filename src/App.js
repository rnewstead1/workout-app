import React, { useState, useEffect } from 'react';
import Workout from './components/Workout';

import './App.css';

function App() {
  const [currentTime, setCurrentTime] = useState(0);

  useEffect(() => {
    fetch('/api/time').then(res => res.json()).then(data => {
      setCurrentTime(data.time);
    });
  }, []);

  return (
    <div className="App" data-testid="app">
      <header className="App-header">
        <p>The current time is {currentTime}.</p>
      </header>
      <Workout />
    </div>
  );
}

export default App;
