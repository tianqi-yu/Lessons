## File / Image Uploading
#### Using `paperclip` to upload locally


##### 0. Install ImageMagick

Make sure you have [ImageMagick](http://www.imagemagick.org/script/index.php) installed. ImageMagick is a library that allow us to resize images in the server and do different kinds of image processing (black&white, transparencies, etc)

```bash
$ brew install imagemagick
```

##### 1. Add `paperclip` gem

In `Gemfile`,

```
gem 'paperclip', '~> 4.3'
```

What do you do after modifying the Gemfile?

##### 2. Create migration files

`$ rails g migration AddImageToPosts`

In `db/migrate/xxx_add_image_to_posts.rb`,

```ruby
class AddImageToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :image
  end
end
```

What do you do after configuring a migration file?

##### 3. Configure Paperclip in `Post` model

In `app/models/post.rb`,

```ruby
class Post < ActiveRecord::Base
  ...

  has_attached_file :image, styles: {
    medium: "300x300>",
    thumb: "100x100>"
  }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
```

##### 4. Allow `image` param in `Posts` controller

```ruby
class PostsController < ApplicationController
  ...

  private

  def post_params
    params.require(:post).permit(:title, :content, :category, :image)
  end
end
```

##### 5. Add image form field in views

In `app/views/posts/_form.html.erb`:

```erb
<%= form_for @post, url: posts_path, html: { multipart: true } do |f| %>
  <%= f.file_field :image %>
<% end %>
```

In `app/views/posts/show.html.erb`:

```erb
<%= image_tag post.image.url %>
```
