import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

export default function Workout() {
  const { workoutId } = useParams();
  const [workoutName, setWorkoutName] = useState('');
  const [sets, setSets] = useState([]);

  useEffect(() => {
    fetch(`/api/workout/${workoutId}`).then(res => res.json()).then(data => {
      setWorkoutName(data.name);
      setSets(data.sets);
    });
  }, [workoutId]);
  return (
    <div className="workout">
      <h1>{workoutName}</h1>
      {sets.map((set, i) => (
        <div key={`${workoutName}-${i + 1}`}>
          <h2>Set {i + 1}</h2>
          {set.map(({ exercise }) => (
            <div key={exercise}>{exercise}</div>
          ))}
        </div>
      ))}
    </div>
  );
}
