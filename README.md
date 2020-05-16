# README

This README would normally document whatever steps are necessary to get the
application up and running.

## System requirements:
* Ruby version: 2.7.1
* MySQL 

## How to get the application up and running:

For development environment
- cp config/env.example.yml config/env.yml
- set needed credientials 
- create new database with name `eCommerce_platform_development`
- run `bundle install`
- run `rails db:migrate`
- run `rails db:seed`
- run `rails server`