import React from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';

export default function WorkoutsList({ workouts }) {
  return (
    <div>
      <ul>
        {workouts.map(({ name, id }) => (
          <li key={name}>
            <Link to={`workout/${id}`}>{name}</Link>
          </li>
        ))}
      </ul>
    </div>
  );
}

WorkoutsList.defaultProps = {
  workouts: []
};

WorkoutsList.propTypes = {
  workouts: PropTypes.arrayOf(PropTypes.shape({
    name: PropTypes.string,
    id: PropTypes.number
  }))
};
