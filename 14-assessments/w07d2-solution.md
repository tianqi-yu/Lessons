# Assessment - Solution
## Week 7 | Day 2

1. To merge `feature2` you need to:

  ```
  git checkout master
  git pull --rebase origin master
  git checkout feature2
  git rebase master
  fix conflicts
  git push origin feature2 -f
  merge feature2 on github
  git checkout master
  git pull --rebase origin master
  ```

1. To nest `resources :posts` inside `api/` you need to:

  ```ruby
  namespace :api do
    resources :posts
  end
  ```

1. The folder structure of `assets/controllers` would have a folder call `api` and inside the folder there would be `posts_controller.rb`. Also the first 2 lines should be:

  ```ruby
  module API
    class PostsController < ApplicationController
    ...
  ```

1. `render json: Post.all`
http://apidock.com/rails/ActionController/Base/render

1. `head xxx` xxx is the status code
