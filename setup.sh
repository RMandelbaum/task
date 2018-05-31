#!/bin/bash

gem install bundler
bundle install
bundle exec rake db:create db:migrate db:seed
echo "
#To change category questions, the DB is set up that you can easily edit directly in the app/views
#To add category questions, the DB is set up that you can easily add directly in the app/views


#User must login to fill out forms
#Either login as username: Rachel password: Password or click become a tasker and sign up

"
