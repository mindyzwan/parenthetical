# Parenthetical
### A screenwriting app

***

## Motivation
This app has been created to provide a low-pressure open source project that is accessible to early career devs.

## Code of Conduct
It's important that every contributor and potential-contributor feels welcome and respected. Please see the code of conduct file in the root directory. By participating in this project, you agree to abide by this code.  

## Setup
Clone this repo to your desktop and run `bundle install` to install all the dependencies.

To setup database, be sure to have PostgreSQL installed. Then run `createdb parenthetical` and `psql -d parenthetical < database/schema.sql`.

If you'd like to have some data to work with, run `psql -d parenthetical < database/seed.sql`. 

## Usage
Once the dependencies are installed, you can run `ruby app.rb` to start the application. You will then be able to access it at `localhost:8080`