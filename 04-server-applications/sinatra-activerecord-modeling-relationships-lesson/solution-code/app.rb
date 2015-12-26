require "bundler/setup"
require "sinatra/activerecord"
require "sinatra"
require "sinatra/reloader" if development?

Dir["#{File.dirname(__FILE__)}/**/*.rb"].each{ |f| also_reload f}


# Load models
require_relative 'models/artist'
require_relative 'models/album'
require_relative 'models/genre'

# Load controllers
require_relative 'controllers/artists_controller'
require_relative 'controllers/genres_controller'
require_relative 'controllers/albums_controller'

ActiveRecord::Base.establish_connection({
  database: 'tunr',
  adapter: 'postgresql'
})


# Close connection
after do
  ActiveRecord::Base.connection.close
end

# General route actions
get '/' do
  erb :home
end

get '/about' do
  erb :about
end