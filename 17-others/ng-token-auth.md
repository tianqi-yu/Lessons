## Learning Rails + Angular.js with Instagram
#### Devise with Angular.js

###What Is NG-Token-Auth

[NG-Token-Auth](https://github.com/lynndylanhurley/ng-token-auth) is a client side module for angular. This module is designed to work out-of-the-box with Devise-Token-Auth.

**IF you are using jquery, you can use [jToker](https://github.com/lynndylanhurley/j-toker)**

---
###How It Works
![how-token-works](https://github.com/lynndylanhurley/ng-token-auth/raw/master/test/app/images/flow/token-update-detail.jpg)

---
###Installing NG-Token-Auth

steps:

1. run `bower install ng-token-auth --save`
2. In `app/assets/javascripts/application.js`
    3. add `//= require ng-token-auth/dist/ng-token-auth`
    4. and make sure you have `//= require angular-cookie/angular-cookie`

---
###Configuring NG-Token-Auth

In `app/assets/javascripts/angular/app.js.erb`

1. add `'ng-token-auth'` to `angular.module`
2. add `'$authProvider'` to `app.config`
3. inside `app.config`, add

```js
    $authProvider.configure({
      // By default, you only need to configure apiUrl
      // Note that if you put a '/' at the end of the link, there will be errors when calling the api
      apiUrl: 'http://localhost:3000'
    })
```

---
<a name="setting-up-routes"></a>
###Setting Up Routes

steps:

 1. in `app/assets/javascripts/angular/app.js.erb`, set new routes for `signup` that refers to `SignUpCtrl` and the corresponding HTML file

```js
     when('/', {
       templateUrl: "<%= asset_path('static_pages/index.html') %>",
       controller: 'StaticPagesCtrl'
     }).
     when('/signup', {
       templateUrl: "<%= asset_path('auth/signup.html') %>",
       controller: 'SignUpCtrl'
     })
```

 2. in `app/assets/javascripts/angular/controllers`, create `signup.js.erb` and `login.js.erb`

```js
    app.controller('SignUpCtrl', ['$scope', function($scope){

    }])
```

 3. in `app/assets/templates/auth`, create `signup.html`

```html
    <div class="container">
      <div class="row">
        <h1>Sign Up</h1>

      </div>
    </div>
```

 4. in `app/assets/templates/static_pages/index.html` add a button redirecting to `/#/signup`

```html
    <div class="container">
      <div class="row">
        <h1> {{ message }} </h1>
      </div>

      <div class="row">
        <a href="/#/signup"><button class="btn btn-primary">Signup</button></a>
      </div>
    </div>
```

---
<a name="signup"></a>
###Signup

steps:

1. In `signup.js.erb` add `$auth` and `$location`
2. add this code

```js
    $scope.signup = function () {
      $auth.submitRegistration($scope.registrationForm).
       then(function(resp) {
         // handle success response
         console.log(resp);

         // redirect back to root when registration succesfull
         $location.path('/');
       }).
       catch(function(resp) {
         // handle error response
         console.log(resp);
       });
    };
```

3. in `signup.html` add a form. You will need three inputs `email`, `password`, and `password_confirmation`

```html
    <div class="container">
      <div class="row">
        <h1>Sign Up</h1>
        <form ng-submit="signup()" role="form" ng-init="registrationForm = {}">
          <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" ng-model="registrationForm.email" required="required" class="form-control" placeholder="Enter Email"/>
          </div>

          <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" ng-model="registrationForm.password" required="required" class="form-control" placeholder="Enter Password"/>
          </div>

          <div class="form-group">
            <label>password Confirmation</label>
            <input type="password" name="password_confirmation" ng-model="registrationForm.password_confirmation" required="required" class="form-control" placeholder="Enter Password Confirmation"/>
          </div>

          <button type="submit" class="btn btn-primary btn-lg">Register</button>
          <a href="/#/"><button class="btn btn-danger btn-lg">Back</button></a>
        </form>
      </div>
    </div>
```

---
###Logout

1. in `app/assets/angular/controllers/static_pages.js.erb` add this code

```js
      $scope.logout = function () {
        $auth.signOut().then(function(resp) {
          console.log(resp);
        }).catch(function(resp) {
          console.log(resp);
        });
      };
```

2. in `app/assets/templates/static_pages/index.html` add a button that calls the logout function when clicked

```html
    <button class="btn btn-danger" ng-click="logout()">Logout</button>
```

---
###Login

Repeat the steps in [Setting Up Routes](#signup) and [Using Ng-Token-Auth For Signup](setting-up-routes) with the following changes

1. in `login.js.erb`, instead of using `$auth.submitRegistration` use `$auth.submitLogin`
2. in `login.js.erb`, instead of using `$scope.registrationForm` use `$scope.loginForm`
3. in `login.html`, instead of having three inputs `email`, `password`, and `password_confirmation` use only `email` and `password`
4. in `login.html`, instead of using `registrationForm` use `loginFrom`

---
###Extra Information. There are more stuff you can do!

Aside from signup, login, and logout, there is actually many more functions like forget password, reset password, facebook login...etc. For more [read this](https://github.com/lynndylanhurley/ng-token-auth#api)

Aside from functions, there are events like `auth:login-success`. Using these, will be able to know when a user login even if you are not in the login controller! For more [read this](https://github.com/lynndylanhurley/ng-token-auth#events)