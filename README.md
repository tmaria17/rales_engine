# Rales Engine
First solo project for Module 3 of Turing's Back-End Engineering program. This project uses Rails and ActiveRecord to to build a JSON API that exposes sales engine data.


# Prerequisites/ Dependencies
 This project assumes you have installed: 
 * Ruby 2.4.1
 * Rails 5.2.1
 * Byebug
 * Capybara
 * Pry
 * Shoulda-Matchers
 * SimpleCov
 * fast_jasonapi


## Installing

1. Clone down the repo:

` git clone git@github.com:tmaria17/rales_engine.git`

2. Run:

`bundle install`

`bundle update`

3. Setup the database:

 `rake db:setup`
 
 4. Import CSV Data:
  `rake import:all`



## Running the tests
To run the full testing suite, run `rspec` from the command line.




## Contributors

[Maria Torres](https://github.com/tmaria17)
