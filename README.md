# Viewing Party

## Background and Description

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and friends.

## Learning Goals
- Consume JSON APIs that require authentication
- Build an application that requires basic authentication
- Organize and refactor code to be more maintainable
- Implement a self-referential relationship in ActiveRecord
- Apply RuboCop’s style guide for code quality
- Utilize Continuous Integration using Travis CI
- Deploy to Heroku

## Requirements
- Rails 5.2.x
- PostgreSQL
- Test all feature and model code
- GitHub branching, team code reviews via GitHub comments, and github projects to track progress on user stories
- Deploy completed code to Heroku
- Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)

## Database Schema
![Schema](https://user-images.githubusercontent.com/83834410/136859707-5369b3fe-8284-4804-9dbe-b90f29f42395.png)

## Setup
This project requires Ruby 2.7.2.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:{create,migrate}`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Live App
[Link to Heroku deployment](https://limitless-basin-76464.herokuapp.com/)

## Tools Used

| Development    |  Testing             |
| :-------------:| :-------------------:|
| Ruby 2.7.2     | SimpleCov            |
| Rails 5.2.6    | Pry                  |
| HTML5          | Capybara             |
| Bootstrap      | ShouldaMatcher       |
| Atom           | Launchy              |
| Git            | Orderly              |
| Github         | Factorybot/Faker     |
| Github Project | Faraday              |
| Postico        | RSpec                |
| Heroku         | VCR                  |
|                | Webmock              |

## Contact
Created by:

* Rowan DeLong [GitHub](https://github.com/RowanDW) • [LinkedIn](https://www.linkedin.com)
* Kevin Nguyen [GitHub](https://github.com/denverdevelopments) • [LinkedIn](https://www.linkedin.com/in/kevin-nguyen-59510520a/)
