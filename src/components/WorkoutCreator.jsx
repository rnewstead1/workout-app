import React, { useEffect } from 'react';

export default function WorkoutCreator() {
  const [allExercises, setAllExercises] = React.useState([]);
  const [selectedExercises, setSelectedExercises] = React.useState({});
  const [workoutName, setWorkoutName] = React.useState('');
  const handleChange = (e) => {
    // console.log(e);
    // console.log(e.target.checked);
    // console.log(e.target.value);
    setSelectedExercises({ ...selectedExercises, [e.target.value]: e.target.checked });
    // console.log(selectedExercises);
  };
  const handleNameChange = (e) => {
    // console.log(e.target.value);
    setWorkoutName(e.target.value);
    // console.log(workoutName);
  };
  const handleSubmit = (event) => {
    // console.log(workoutName);
    // console.log(selectedExercises);
    const requestOptions = {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        title: workoutName,
        exercises: selectedExercises
      })
    };
    fetch('/api/workout', requestOptions)
      .then(response => response.json())
      .then(data => this.setState({ postId: data.id }));
    event.preventDefault();
  };

  useEffect(() => {
    fetch('/api/exercises').then(res => res.json()).then(data => {
      setAllExercises(data.exercises);
    });
  }, []);

  return allExercises.length > 0 &&
    (<form onSubmit={handleSubmit}>
      <label>Workout name: <input type="textinput" name="workoutname" onChange={handleNameChange}/></label>
      <ul>
        {
          allExercises.map((exercise) => {
            return (
              <li key={exercise.id}><label>
                <input type="checkbox" name={exercise.name} value={exercise.id} onChange={handleChange}/>
                {exercise.name}
              </label></li>
            );
          })
        }
      </ul>
      <input type="submit" value="Save"/>
    </form>);
}
