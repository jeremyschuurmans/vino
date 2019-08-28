<<<<<<< HEAD
ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
=======
# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
>>>>>>> 838f433e9496433f5afd2ec9171af631f6972d9a
