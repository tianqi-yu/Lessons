## Movie Finder API in Rails

#### Model and migrations
- a user has many likes
- a like belongs to a user
- a like has a movie's omdb_id and title

#### Code

In `Gemfile`,

```ruby
source 'https://rubygems.org'

ruby '2.2.2'
gem 'rails', '4.2.3'

gem 'pg'
gem 'jbuilder', '~> 2.0'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'
gem 'devise_token_auth'
gem 'omniauth'
gem 'rack-cors', :require => 'rack/cors'

group :development do
  gem "web-console"
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.0"
end

```

In `config/database.yml`,

```yaml
default: &default
  adapter: postgresql
  host: localhost
  port: 5432
  pool: 5
  timeout: 5000

development:
  <<: *default
  database: rails_movie_finder_development

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: rails_movie_finder_test

production:
  <<: *default
  database: db/production.sqlite3
```

In `config/routes.rb`,

```ruby
Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :users, only: [:show] do
    resources :likes, only: [:index, :create]
  end

  get '/movies' => 'movies#index'
  get '/movies/:omdb_id' => 'movies#show'
end

```

In `config/application.rb`,

```ruby
config.middleware.insert_before 0, "Rack::Cors" do
  allow do
    origins '*' # Control the domains
    resource '*', :headers => :any, :methods => [:get, :post, :options, :put, :patch, :delete] # Control the resources
  end
end
```

In `app/controllers/application_controller.rb`,

```ruby
class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
end
```

In `app/controllers/movies_controller.rb`,

```ruby
class MoviesController < ApplicationController
  def index
    require 'open-uri'

    url = "http://www.omdbapi.com?s=" + params[:query]
    url_data = open(url).read

    render json: url_data
  end

  def show
    require 'open-uri'

    url = "http://www.omdbapi.com?i=" + params[:omdb_id]
    url_data = open(url).read

    render json: url_data
  end
end
```

In `app/controllers/likes_controller.rb`,

```ruby
class LikesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @likes = @user.likes
    @likes = @likes.where(omdb_id: params[:omdb_id]) if params[:omdb_id]

    render json: @likes, status: :ok
  end

  def create
    @user = User.find(params[:user_id])
    @like = @user.likes.create(omdb_id: params[:like][:omdb_id], title: params[:like][:title])

    render json: @like
  end
end
```