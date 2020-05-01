# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...





Run the app on Mac:

* brew install yarn

* yarn install

* brew install gnupg

* install RVM (https://rvm.io/rvm/install)

* rvm install ruby-2.6.5

* brew install postgresql

* gem install bundler -v 2.0.1

* bundle install

* rails db:migrate

* rails server

* open http://localhost:3000 on the browser


Run as https locally

* openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt

* rails s -b 'ssl://localhost:3000?key=./localhost.key&cert=./localhost.crt'

* open https://localhost:3000 on the browser





Icons by Google Material
* https://material.io/resources/icons/?style=baseline