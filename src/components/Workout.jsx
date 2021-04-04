import React from 'react';
import PropTypes from 'prop-types';

function Workout({ exercises }) {
  return (
      <div className="workout">
        {exercises.map(({ name }) => (
          <div key={name}>{name}</div>
        ))}
      </div>
  );
}

Workout.propTypes = {
  exercises: PropTypes.arrayOf(PropTypes.shape({
    name: PropTypes.string
  }))
};

export default Workout;
