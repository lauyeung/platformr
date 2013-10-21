Platformr README
===================

Platformr is an application that allows weightlifters to track their workouts (live at [platformr.co](https://www.platformr.co)).

Technical Requirements
-------------------
* Ruby 2.0.0p247
* Rails 4.0.0
* PostgreSQL (<tt>rake db:migrate</tt> to set up the database, run <tt>rake db:test:prepare</tt> to set up the test database)
* Run tests using <tt>rake spec</tt> or <tt>rspec [TEST TO RUN]</tt>

Logged-in Index
-------------------
![logged-in](https://lh6.googleusercontent.com/-8r3k2ARsgq8/UmWxh3FOtHI/AAAAAAAANYE/9PQAHj_38ak/w744-h403-no/platformr_main.png)

Add an Exercise / Manage Exercises
-------------------
![add-exercise](https://lh6.googleusercontent.com/-boEulqMAP54/UmWxgHMweZI/AAAAAAAANX8/60JpoOz2kuI/w744-h417-no/platformr_exercises.png)

Add a Workout / Manage Workouts
-------------------
![add-workout](https://lh5.googleusercontent.com/-rR5agqZ2GYM/UmWxdeJ786I/AAAAAAAANX0/PK39JUGEO4Y/w744-h405-no/platformr_add_workout.png)

ER Diagram
-------------------
![er-diagram](https://lh5.googleusercontent.com/-w9Z5yiWA-Hw/UmV_yBhOxiI/AAAAAAAANVo/rpLQd2xQAwM/w705-h552-no/platformr_er_diagram.png)

Next steps
-------------------
* Add additional functionality to edit workout
* Implement comments
* Create social component
