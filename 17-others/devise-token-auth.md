## Learning Rails + Angular.js with Instagram
#### Devise

###What is Devise?

- Pros
  - A flexible authentication solution for Rails
  - Offers a complete MVC solution
  - Allows you to have multiple models (eg. user, admin...etc) signed in at the same time

- Cons
  - By default Devise uses redirection and not JSON. Hence, when ajax request are sent to Devise, your reply would be an HTML render instead of JSON.
  - You can customize Devise to make it work, but this takes too much time and effort

For more [read here](https://github.com/plataformatec/devise)

---
###What is Devise-Token-Auth?

[Devise-Token-Auth](https://github.com/lynndylanhurley/devise_token_auth) is a sibling to Devise where Devise renders HTML, Devise-Token-Auth renders JSON. Therefore, it completely eliminates the cons of Devise mentioned above.

---
###Installing Devise-Token-Auth

Steps:

1. In the gemfile add `gem 'devise_token_auth'` and add `gem 'omniauth'`
2. run `bundle install`

---
###Using Devise-Token-Auth

####Step 1) Generating The Necessary Files

Whenever you want a MVC dealing with authentication, you would need to edit/create routes, controller, model, migration. Devise-Token-Auth does this for you in 1 command

`rails g devise_token_auth:install [USER_CLASS] [MOUNT_PATH]`

There are two variables to input `[USER_CLASS]` and `[MOUNT_PATH]`

`[USER_CLASS]` is that name of the model you want (eg. User and Admin)

`[MOUNT_PATH]` is what the route's path will be based on. Below are some examples when `[MOUNT_PATH]` is set to `auth`

```
            user_session POST   /auth/sign_in(.:format)                devise_token_auth/sessions#create
    destroy_user_session DELETE /auth/sign_out(.:format)               devise_token_auth/sessions#destroy
```

**Tip** If you only have 1 model that needs authentication, then use `auth` as `[MOUNT_PATH]`

Following are the files that will be created/edited

- An initializer will be created at `config/initializers/devise_token_auth.rb`
- A model will be created in the `app/models` directory. If the model already exists, a concern will be included at the top of the file
- Routes will be appended to file at `config/routes.rb`
- A concern will be included by your application controller at `app/controllers/application_controller.rb`
- A migration file will be created in the `db/migrate` directory.


####Step 2) Configuring The Model Base On Needs

In `app/models/USER_CLASS.rb` you will see

```ruby
 devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
```

**For our purposes, please remove `:confirmable`**

To know more about individual modules, [read here](https://github.com/lynndylanhurley/devise_token_auth#excluding-modules)

####Step 3) Configuring The Migration Base On Needs

In `db/migrate` find the migration generated

**For our purpose remove/comment out the `Confirmable` columns**

```ruby
class DeviseTokenAuthCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :name
      t.string :nickname
      t.string :image
      t.string :email

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :users, :email
    add_index :users, [:uid, :provider],     :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end
end
```

####Step 4) Running The Migrations

Run `rake db:migrate`

The back-end is now ready for use!