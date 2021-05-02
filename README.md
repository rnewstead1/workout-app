# Workout App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

Api built with [Python Flask framework](https://flask.palletsprojects.com/).

## How to run

In the project directory, start the api:

```bash
npm run start-api
```

From another terminal in the project directory, start the frontend:

```bash
npm start
```

The app will be running in development mode on [http://localhost:3000](http://localhost:3000).

![Data Structure](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/rnewstead1/workout-app/main/data-structure.txt)

## Adding a new db migration
From the root dir:

```bash
source api/venv/bin/activate
yoyo add --sql -m MIGRATION_NAME
```

You can view the data in the db from the commandline by installing `sqlite3` via Brew, and run from the root dir:

```bash
sqlite3 api/workout_app.db
```

## TODO
- [ ] Add feature to create new exercises
- [ ] Add feature to create new workout from list of exercises
- [ ] Add timer functionality for workout
- [ ] Add tests
- [ ] Add python linter
- [ ] Frontend styling
- [ ] Deployment