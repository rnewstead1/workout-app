-- Rollback add-workouts
-- depends: 20210410_02_88EMw-add-basic-workout

DELETE FROM workout_exercise WHERE workout_id = (SELECT id FROM workout WHERE name = 'Core');
DELETE FROM workout_exercise WHERE workout_id = (SELECT id FROM workout WHERE name = 'Legs');

DELETE FROM exercise WHERE name = ('Plank to press');
DELETE FROM exercise WHERE name = ('Bear crawl');
DELETE FROM exercise WHERE name = ('Glute bridge left leg');
DELETE FROM exercise WHERE name = ('Glute bridge right leg');
DELETE FROM exercise WHERE name = ('Bear position twists');
DELETE FROM exercise WHERE name = ('Toe taps');
DELETE FROM exercise WHERE name = ('Bear squats');
DELETE FROM exercise WHERE name = ('Elevator squats');
DELETE FROM exercise WHERE name = ('Squat wall hold');
DELETE FROM exercise WHERE name = ('Skater jumps');
DELETE FROM exercise WHERE name = ('Side lunge left');
DELETE FROM exercise WHERE name = ('Side lunge right');
DELETE FROM exercise WHERE name = ('Single leg squat right');
DELETE FROM exercise WHERE name = ('Single leg squat left');
DELETE FROM exercise WHERE name = ('Step up right');
DELETE FROM exercise WHERE name = ('Step up left');
DELETE FROM exercise WHERE name = ('Lunge walk');
DELETE FROM exercise WHERE name = ('Russian dead lift left');
DELETE FROM exercise WHERE name = ('Russian dead lift right');

DELETE FROM workout WHERE name = 'Core';
DELETE FROM workout WHERE name = 'Legs';