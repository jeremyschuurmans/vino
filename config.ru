<<<<<<< HEAD
require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
run ApplicationController
use UsersController
use WinesController
=======
# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
>>>>>>> 838f433e9496433f5afd2ec9171af631f6972d9a
