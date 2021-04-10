-- Add basic workout
-- depends: 20210410_01_eO7I9-add-tables

INSERT INTO exercise (name) VALUES ('Squats');
INSERT INTO exercise (name) VALUES ('Press up walkouts');
INSERT INTO exercise (name) VALUES ('Arabesque right leg');
INSERT INTO exercise (name) VALUES ('Arabesque left leg');
INSERT INTO exercise (name) VALUES ('Reverse plank leg raise');
INSERT INTO exercise (name) VALUES ('Russian twists');

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