-- Rollback basic workout
-- depends: 20210410_01_eO7I9-add-tables

DELETE FROM workout_exercise WHERE workout_id = (SELECT id FROM workout WHERE name = 'Basic');

DELETE FROM exercise WHERE name = 'Squats';
DELETE FROM exercise WHERE name = 'Press up walkouts';
DELETE FROM exercise WHERE name = 'Arabesque right leg';
DELETE FROM exercise WHERE name = 'Arabesque left leg';
DELETE FROM exercise WHERE name = 'Reverse plank leg raise';
DELETE FROM exercise WHERE name = 'Russian twists';
DELETE FROM exercise WHERE name = 'Side plank right';
DELETE FROM exercise WHERE name = 'Side plank left';
DELETE FROM exercise WHERE name = 'Standing bicycles';
DELETE FROM exercise WHERE name = 'Sit ups';
DELETE FROM exercise WHERE name = 'Back lunge right';
DELETE FROM exercise WHERE name = 'Back lunge left';

DELETE FROM workout WHERE name = 'Basic';
