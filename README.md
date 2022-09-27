# README

This application (Split) will track physical workouts for the user. The dataset below
will model the business process by allowing a Workout to have many Exercises
and an Exercise to have many Sets.

The database will have 3 tables; Workout, Exercise, and Set. The columns on the
Workout table will simply be name :string and description :text. A Workout will
have many Exercises so the Exercise table will have a workout_id foreign key
along with a name :string and a description :text. For each Exercise there will
be many Sets so the Set table will have an exercise_id foreign key along with the
number of reps :int and amount of weight :int (as pounds).

Users will enter their own data, it won't be pulled from an external API so the data
models will be populated by Faker or from a .csv for this project.

