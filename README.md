# Fitness application - [recur](https://recur.herokuapp.com/)

# Overview
Here is the source code for the fitness monitoring application recur.
It's built using Ruby on Rails.


# Installation
**Requires Ruby 2.0.0, [RubyGems](http://rubygems.org/pages/download), and the [Bundler](http://bundler.io/#getting-started) gem**


Running these commands from the command line should get you up and running

```
git clone https://github.com/wilsonand1/recur.git
cd recur
bundle install --without production
rake db:migrate
rails s
```

Then point your browser to `http://localhost:3000` and enjoy.

# Running tests
Test are run using Rspec. To run tests use the command

```
rspec spec/
````

All of the test should now run and pass.
