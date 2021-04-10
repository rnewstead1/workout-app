-- Add tables

-- depends: 

CREATE TABLE workout (
    id INTEGER NOT NULL,
    name VARCHAR(244) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE exercise (
    id INTEGER NOT NULL,
    name VARCHAR(244) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE workout_exercise (
    id INTEGER NOT NULL,
    workout_id INTEGER NOT NULL,
    exercise_id INTEGER NOT NULL,
    exercise_position INTEGER NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (workout_id, exercise_position)
);