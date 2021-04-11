-- Add basic workout
-- depends: 20210410_01_eO7I9-add-tables

INSERT INTO exercise (name) VALUES ('Squats');
INSERT INTO exercise (name) VALUES ('Press up walkouts');
INSERT INTO exercise (name) VALUES ('Arabesque right leg');
INSERT INTO exercise (name) VALUES ('Arabesque left leg');
INSERT INTO exercise (name) VALUES ('Reverse plank leg raise');
INSERT INTO exercise (name) VALUES ('Russian twists');
INSERT INTO exercise (name) VALUES ('Side plank right');
INSERT INTO exercise (name) VALUES ('Side plank left');
INSERT INTO exercise (name) VALUES ('Standing bicycles');
INSERT INTO exercise (name) VALUES ('Sit ups');
INSERT INTO exercise (name) VALUES ('Back lunge right');
INSERT INTO exercise (name) VALUES ('Back lunge left');

INSERT INTO workout (name) VALUES ('Basic');

INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Squats'),
    1
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Press up walkouts'),
    2
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Arabesque right leg'),
    3
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Arabesque left leg'),
    4
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Reverse plank leg raise'),
    5
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Russian twists'),
    6
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Side plank right'),
    7
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Side plank left'),
    8
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Standing bicycles'),
    9
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Sit ups'),
    10
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Back lunge right'),
    11
);
INSERT INTO workout_exercise (workout_id, exercise_id, exercise_position) VALUES (
    (SELECT id FROM workout WHERE name = 'Basic'),
    (SELECT id FROM exercise WHERE name = 'Back lunge left'),
    12
);