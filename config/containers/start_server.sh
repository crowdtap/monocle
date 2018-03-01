#!/usr/bin/env bash
set -ex
export RAILS_ENV=$RAILS_ENV
export RACK_ENV=$RAILS_ENV
bundle install --path .localgems
bundle exec unicorn -c config/unicorn.rb
