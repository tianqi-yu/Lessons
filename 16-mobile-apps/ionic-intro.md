## Ionic

- Building a mobile app (both Android and iOS) with Angular.js and Cordova
- Getting started guide from Ionic: http://ionicframework.com/getting-started/

#### 1. Install Ionic

```
$ npm install -g cordova ionic
```

#### 2. Start a project

```
$ ionic start myApp [blank/tabs/sidemenu]
```

#### 3. Run it

```
$ cd myApp

# for web page
$ ionic serve

# building a mobile app and emulate
$ ionic platform add ios
$ ionic build ios
$ ionic emulate ios

# another way to build a mobile app and emulate
# ionic run
```
