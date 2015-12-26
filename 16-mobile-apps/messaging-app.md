## Real Time Messaging app with Ionic

#### Start a project called `ionic-firebase-messaging`

```
$ ionic start ionic-firebase-messaging tabs
```

#### Replace the Chats services!

```js
.controller('ChatsCtrl', function($scope) {
  $scope.chats = [{
    id: 0,
    name: 'GA HK WDI 8',
    face: 'https://pbs.twimg.com/profile_images/616323696601468930/SkNd2ppU.png'
  }]
})

.controller('ChatDetailCtrl', function($scope, $stateParams) {
  console.log($stateParams.chatId);
})
```

#### Add dependencies to connect to Angularfire / Firebase

- What is Firebase?
  + With Firebase, you can store data and authenticate users in your app with just a few lines of code.

 - What's AngularFire?
   + A library that power us to use Firebase in Angular.js

```
$ bower install firebase --save
```

```
$ bower install angularfire --save
```

In `www/index.html`, add the corresponding javascript files:

```html
    <!-- Firebase and Angularfire -->
    <script src="lib/firebase/firebase.js"></script>
    <script src="lib/angularfire/dist/angularfire.min.js"></script>
```

In `www/js/app.js`, attach dependencies in Angular app:

```js
angular.module('starter', ['ionic', 'starter.controllers', 'starter.services', 'firebase'])
```

#### Sign up for Firebase on firebase.com and make a new app!
- [firebase.com](firebase.com)

#### Sending messages

In `www/js/controllers.js`,

```js
.controller('ChatDetailCtrl', function($scope, $stateParams, $firebaseArray) {
  console.log($stateParams.chatId);

  var ref = new Firebase("https://glowing-fire-2513.firebaseio.com/messages");

  $scope.messages = $firebaseArray(ref);

  $scope.addMessage = function() {
    $scope.messages.$add({
      text: $scope.newMessage
    });
  };
})
```

In `www/templates/chat-detail.html`,

```html
<ion-view view-title="Individual Chat">
  <ion-content class="padding">
    <p ng-repeat="message in messages track by $index">
      {{ message.text }}
    </p>
  </ion-content>
</ion-view>

<ion-footer-bar>
  <form class="item item-input-inset" ng-submit="addMessage()">
    <label class="item-input-wrapper">
      <input type="text" placeholder="type here..." ng-model="newMessage">
    </label>
    <button class="button button-small">
      Send
    </button>
  </form>
</ion-footer-bar>
```

#### $watch and scroll to the bottom whenever messages arrive!

In ` www/js/controllers.js`,

```js
.controller('ChatDetailCtrl', function($scope, $stateParams, $firebaseArray, $ionicScrollDelegate) {
  ...

  $scope.$watch('messages', function() {
    $ionicScrollDelegate.scrollBottom();
  }, true);
})
```

#### Attach bottom input box to keyboard

In `www/templates/chat-detail.html`,

```html
<ion-footer-bar keyboard-attach>

...

</ion-footer-bar>
```

#### Set user name whenever they message

In `www/js/controllers.js`,

```js

.controller('ChatDetailCtrl', function($scope, $stateParams, $firebaseArray, $ionicScrollDelegate, $window) {
  var user = $window.localStorage.getItem('currentName')

  ...

  $scope.addMessage = function() {
    $scope.messages.$add({
      text: $scope.newMessage,
      user: user ? user : "Anonymous"
    });

    $scope.newMessage = "";
  };

  ...
})

.controller('AccountCtrl', function($scope, $window, $ionicPopup) {
  $scope.form = {};
  $scope.form.currentName = $window.localStorage.getItem('currentName');

  $scope.form.setCurrentName = function() {
    $window.localStorage.setItem('currentName', $scope.form.currentName);

    $ionicPopup.alert({
     title: 'Name is set',
     template: $scope.form.currentName
   });
  };
```

In `www/templates/chat-detail.html`,

```html
...

    <ul class="list">
      <li class="item" ng-repeat="message in messages track by $index">
        <h2>{{ message.user }}</h2>
        <p>
          {{ message.text }}
        </p>
      </li>
    </ul>

...
```

In `www/templates/tab-account.html`,

```html
<ion-view view-title="Account">
  <ion-content>

    <form class="item item-input-inset" ng-submit="form.setCurrentName()">
      <label class="item-input-wrapper">
        <input type="text" placeholder="enter your name..." ng-model="form.currentName">
      </label>
      <button class="button button-small">
        Set Name
      </button>
    </form>

  </ion-content>
</ion-view>
```