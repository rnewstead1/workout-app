-- add-workouts
-- depends: 20210410_02_88EMw-add-basic-workout

INSERT INTO exercise (name) VALUES ('Plank to press');
INSERT INTO exercise (name) VALUES ('Bear crawl');
INSERT INTO exercise (name) VALUES ('Glute bridge left leg');
INSERT INTO exercise (name) VALUES ('Glute bridge right leg');
INSERT INTO exercise (name) VALUES ('Bear position twists');
INSERT INTO exercise (name) VALUES ('Toe taps');
INSERT INTO exercise (name) VALUES ('Bear squats');

INSERT INTO workout (name) VALUES ('Core');

INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Press up walkouts'),
    1
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Reverse plank leg raise'),
    2
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Side plank right'),
    3
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Side plank right'),
    4
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Bear crawl'),
    5
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Russian twists'),
    6
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Plank to press'),
    7
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Glute bridge left leg'),
    8
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Glute bridge left leg'),
    9
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Bear position twists'),
    10
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Toe taps'),
    11
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Core'),
    (SELECT id FROM exercise WHERE name = 'Bear squats'),
    12
);

INSERT INTO exercise (name) VALUES ('Elevator squats');
INSERT INTO exercise (name) VALUES ('Squat wall hold');
INSERT INTO exercise (name) VALUES ('Skater jumps');
INSERT INTO exercise (name) VALUES ('Side lunge left');
INSERT INTO exercise (name) VALUES ('Side lunge right');
INSERT INTO exercise (name) VALUES ('Single leg squat right');
INSERT INTO exercise (name) VALUES ('Single leg squat left');
INSERT INTO exercise (name) VALUES ('Step up right');
INSERT INTO exercise (name) VALUES ('Step up left');
INSERT INTO exercise (name) VALUES ('Lunge walk');
INSERT INTO exercise (name) VALUES ('Russian dead lift left');
INSERT INTO exercise (name) VALUES ('Russian dead lift right');

INSERT INTO workout (name) VALUES ('Legs');

INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Elevator squats'),
    1
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Side lunge left'),
    2
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Side lunge right'),
    3
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Single leg squat right'),
    4
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Single leg squat left'),
    5
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Lunge walk'),
    6
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Squat wall hold'),
    7
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Step up left'),
    8
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Step up right'),
    9
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Skater jumps'),
    10
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Russian dead lift left'),
    11
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Legs'),
    (SELECT id FROM exercise WHERE name = 'Russian dead lift right'),
    12
);