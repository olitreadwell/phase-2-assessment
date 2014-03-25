# Student Organization Management Application
By now you should be familiar with basic sinatra apps and creating simple websites.  This problem will give you a chance to demonstrate your proficiency with the web by writing code for controllers, authentication, views, and basic HTML forms with a little bit of CSS. We're going full [CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete) and building a student oranization management application.

The problem is broken into 4 parts.  You will need to complete each part to move on. We've given approximate timing for each part.  If you find you are taking a lot longer be sure to ask questions.

## Objectives

### Part 1: Authentication (Timing ~ 30 min)

Authentication is a central concern of most web applications.  We're going to start by creating a simple app that does nothing more than authenticate a student.


#### Student Model

You have an empty `Student` model and a database with a `students` table.  Add validations to the `Student` model which guarantee the following:

1. Every student has an email
2. Every student's email is unique
3. Every email looks like `* @ *.*`
4. Every student has a password

You should not store the student's password directly in the database.

#### Sign Up, Log In, Log Out

Create views to allow a student to:

1. Sign up as a new student
2. Log in as an existing student
3. Log out as an existing student

### Part 2: Events  (Timing ~ 30 min)
We have students and events.  Students can attend many events and an event can be attended by many students.  Events are student-created, too, so an event belongs to a student and a student can create multiple events.

#### Associations

We've already defined the three models for you.  You'll need to create the associations between them.

The `Student` model should have two associations on it:

1. ``student.created_events
`` should return the list of events created by the student
2. ``student.attended_events`` should return the list of events the student is attending or has attended

To be clear, ```created_events``` and ```attended_events``` should return completely different results (we are not asking you to create an alias).

To help you along your way, we recommend reviewing the ActiveRecord documentation, specifically the available options for the association methods you'll be using.

### Part 3: CRUD It Up (Timing ~ 45 min)

With student authentication in place, create pages which let the student create new events, show their created events, edit events, and destroy events.

### Part 4: AJAXify it (Timing ~ 30 min)
On the page that lists all the events created by the student, add the form for creating a new event.  Use AJAX on this form so that when a student adds a new event, that new event is appended to the list of created events without refreshing the page.