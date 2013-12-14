#!/usr/bin/env ruby
require 'rails'
require 'active_record'
require 'pry'

binding.pry

db_config = YAML.load_file("#{Dir.pwd}/config/database.yml")
ActiveRecord::Base.establish_connection db_config['development']
db = ActiveRecord::Base.connection
p db.tables

schema = Schemap::Schemap.generate_schema db.tables
p schema
