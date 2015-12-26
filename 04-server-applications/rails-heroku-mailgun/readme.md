## Sending Email from Heroku

### Configuring mailer locally

[ActionMailer](http://guides.rubyonrails.org/action_mailer_basics.html)

##### Generate UserMailer

```bash
$ rails generate mailer UserMailer

create  app/mailers/user_mailer.rb
create  app/mailers/application_mailer.rb
invoke  erb
create    app/views/user_mailer
create    app/views/layouts/mailer.text.erb
create    app/views/layouts/mailer.html.erb
```

##### Configure ApplicationMailer
```rb
# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'
end
```

##### Configure UserMailer
```rb
# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
```

##### Configure Email to be sent (html & text)
```html
<!-- app/views/layouts/mailer.html.erb -->
<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Welcome to example.com, <%= @user.name %></h1>
    <p>
      You have successfully signed up to example.com,
      your username is: <%= @user.login %>.<br>
    </p>
    <p>
      To login to the site, just follow this link: <%= @url %>.
    </p>
    <p>Thanks for joining and have a great day!</p>
  </body>
</html>
```

##### Send Email

```rb
class UsersController < ApplicationController
  ...
  def create
    @user = User.new(params[:user])

    if @user.save
      # Tell the UserMailer to send a welcome email after save
      UserMailer.welcome_email(@user).deliver_now

      redirect_to(@user, notice: 'User was successfully created.') }
    else
      format.html { render action: 'new'
    end
  end
end
```

### Configure Email in Heroku

To send emails in heroku we will use a service called [MailGun](https://elements.heroku.com/addons/mailgun). It has a good documentation on [how to easily deploy to heroku](https://devcenter.heroku.com/articles/mailgun#deploying-to-heroku)

````bash
$ heroku addons:create mailgun:starter
 ```

In `config/environments/production.rb`:

```rb
Rails.application.configure do
  ...
end

ActionMailer::Base.smtp_settings = {
  :port           => ENV['MAILGUN_SMTP_PORT'],
  :address        => ENV['MAILGUN_SMTP_SERVER'],
  :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => 'yourapp.heroku.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
```

