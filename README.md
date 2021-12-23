# README

This is a small and simple application demonstrating an authorized User performing CRUD operations on users and listings models with an emphasis on test-driven development with MiniTest.

Highlights: Rails 7 app, Sorcery for authentication. 
Very little focused on UI design and UX, more concerned with writing tests, testing validations and user flow, associating models, little to no scaffolding.

This app demonstrates:

- tests written for controller, models, and system test

- low level setup of authentication with Sorcery: creating custom session controllers and authentication sign in flow

- welcome page is hidden from unauthenticated users

- nesting routes that are needed and specifying exceptions

- model validations to make sure record exists, is of certain length, and if necessary test strings contain only digits

- deployment to Heroku as functioning app

Things I would have like to demonstrate but ran out of time

- keep authenticated users from being authorized to edit other user posts

- allow for search querying of zipcodes and display a map pin pointing location with mapbox api. Could search within x amount of miles

- user profile with location details set once (zipcode) so when they post a listing the zipcode would be associated with the post removing the need to enter zipcode repeatedly

- upload images for thumbnails of listings. upload images to s3 bucket

- favorite/like listings to save in a user's "places I want to go visit" section.

- ..sky's the limit


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
Ruby 3.0.1
Rails 7.0.0

- git clone repo
- bundle install
- rails s
- rails db:create
- rails db:migrate

other notes:
- postgres for database
- minitest:
  - rails test
  - rails test:system to run system tests

