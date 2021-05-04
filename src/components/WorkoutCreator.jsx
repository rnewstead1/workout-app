import React, { useEffect } from 'react';

export default function WorkoutCreator() {
  const [allExercises, setAllExercises] = React.useState([]);

  useEffect(() => {
    fetch('/api/exercises').then(res => res.json()).then(data => {
      setAllExercises(data.exercises);
    });
  }, []);

  return allExercises.length > 0 &&
    (<form>
      {
        allExercises.map((exercise) => {
          return (
            <label key={exercise.id}>
              {exercise.name}
              <input type="checkbox" name={exercise.name} value={exercise.id}/>
            </label>
          );
        })
      }
    </form>);
}
