# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Role.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all
Agent.destroy_all

# Generate models and tables, according to the domain model.
# IN TERMINAL I WROTE THE FOLLOWING:
#rails generate model Studio
#rails generate model Movie
#rails generate model Actor
#rails generate model Role
#rails generate model Agent
#rails db:migrate


# # Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# create studios
warner = Studio.new
warner["name"] = "Warner Bros."
warner.save

# create movies
begins = Movie.new
begins["title"] = "Batman Begins"
begins["year_released"] = 2005
begins["rated"] = "PG-13"
begins["studio_id"] = warner["id"]
begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = warner["id"]
dark_knight.save

rises = Movie.new
rises["title"] = "The Dark Knight Rises"
rises["year_released"] = 2012
rises["rated"] = "PG-13"
rises["studio_id"] = warner["id"]
rises.save

# Actors
bale = Actor.new
bale["name"] = "Christian Bale"
bale.save

caine = Actor.new
caine["name"] = "Michael Caine"
caine.save

neeson = Actor.new
neeson["name"] = "Liam Neeson"
neeson.save

holmes = Actor.new
holmes["name"] = "Katie Holmes"
holmes.save

oldman = Actor.new
oldman["name"] = "Gary Oldman"
oldman.save

ledger = Actor.new
ledger["name"] = "Heath Ledger"
ledger.save

eckhart = Actor.new
eckhart["name"] = "Aaron Eckhart"
eckhart.save

gyllenhaal = Actor.new
gyllenhaal["name"] = "Maggie Gyllenhaal"
gyllenhaal.save

hardy = Actor.new
hardy["name"] = "Tom Hardy"
hardy.save

gordon_levitt = Actor.new
gordon_levitt["name"] = "Joseph Gordon-Levitt"
gordon_levitt.save

hathaway = Actor.new
hathaway["name"] = "Anne Hathaway"
hathaway.save

# Roles (Batman Begins)
r = Role.new
r["movie_id"] = begins["id"]
r["actor_id"] = bale["id"]
r["character_name"] = "Bruce Wayne"
r.save

r = Role.new
r["movie_id"] = begins["id"]
r["actor_id"] = caine["id"]
r["character_name"] = "Alfred"
r.save

r = Role.new
r["movie_id"] = begins["id"]
r["actor_id"] = neeson["id"]
r["character_name"] = "Ra's Al Ghul"
r.save

r = Role.new
r["movie_id"] = begins["id"]
r["actor_id"] = holmes["id"]
r["character_name"] = "Rachel Dawes"
r.save

r = Role.new
r["movie_id"] = begins["id"]
r["actor_id"] = oldman["id"]
r["character_name"] = "Commissioner Gordon"
r.save

# Roles (The Dark Knight)
r = Role.new
r["movie_id"] = dark_knight["id"]
r["actor_id"] = bale["id"]
r["character_name"] = "Bruce Wayne"
r.save

r = Role.new
r["movie_id"] = dark_knight["id"]
r["actor_id"] = ledger["id"]
r["character_name"] = "Joker"
r.save

r = Role.new
r["movie_id"] = dark_knight["id"]
r["actor_id"] = eckhart["id"]
r["character_name"] = "Harvey Dent"
r.save

r = Role.new
r["movie_id"] = dark_knight["id"]
r["actor_id"] = caine["id"]
r["character_name"] = "Alfred"
r.save

r = Role.new
r["movie_id"] = dark_knight["id"]
r["actor_id"] = gyllenhaal["id"]
r["character_name"] = "Rachel Dawes"
r.save

# Roles (The Dark Knight Rises)
r = Role.new
r["movie_id"] = rises["id"]
r["actor_id"] = bale["id"]
r["character_name"] = "Bruce Wayne"
r.save

r = Role.new
r["movie_id"] = rises["id"]
r["actor_id"] = oldman["id"]
r["character_name"] = "Commissioner Gordon"
r.save

r = Role.new
r["movie_id"] = rises["id"]
r["actor_id"] = hardy["id"]
r["character_name"] = "Bane"
r.save

r = Role.new
r["movie_id"] = rises["id"]
r["actor_id"] = gordon_levitt["id"]
r["character_name"] = "John Blake"
r.save

r = Role.new
r["movie_id"] = rises["id"]
r["actor_id"] = hathaway["id"]
r["character_name"] = "Selina Kyle"
r.save

# Agent
ari = Agent.new
ari["name"] = "Ari Emanuel"
ari.save

# Assign agent to Christian Bale
bale["agent_id"] = ari["id"]
bale.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!
