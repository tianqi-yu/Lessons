## Movie Finder Mobile App (both Android and iOS)

#### Start a project called `movieFinder`

```
$ ionic start movieFinder sidemenu
```

#### Searching a movie

In `www/js/app.js`,

```js
angular.module('starter', ['ionic', 'starter.controllers'])

...

.config(function($stateProvider, $urlRouterProvider, $authProvider) {
  $stateProvider

  .state('app', {
    url: '/app',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller: 'AppCtrl'
  })

  .state('app.movies', {
    url: '/movies',
    views: {
      'menuContent': {
        templateUrl: 'templates/movies.html',
        controller: 'MoviesSearchCtrl'
      }
    }
  })

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/movies');
});
```

In `www/js/controllers.js`,

```js
angular.module('starter.controllers', [])

...

.controller('MoviesSearchCtrl', function($scope, $stateParams, $http) {
  $scope.movieForm = {};

  $scope.movieForm.searchMovie = function(){
    $http.get('http://localhost:3000/movies?query=' + $scope.movieForm.movieName).success(function(response){
      console.log(response.Search);
      $scope.movies = response.Search;
    }).error(function(resp){
      console.log(resp);
    });
  };
});
```

In `www/templates/movies.html`,

```html
<ion-view view-title="Search Movies">
  <ion-content>

    <div class="list">
      <div class="item item-input-inset">
        <label class="item-input-wrapper">
          <input type="text" placeholder="Search by movie name" ng-model="movieForm.movieName">
        </label>
        <button class="button button-small" ng-click="movieForm.searchMovie()">
          Submit
        </button>
      </div>
    </div>

    <ion-spinner icon="spiral" class="center" style="margin: 0 auto;"></ion-spinner>

    <div class="list">
      <a class="item" ui-sref="app.singleMovie({ id: movie.imdbID })" ng-repeat="movie in movies">
        <h2>{{ movie.Title }}</h2>
        <p>{{ movie.Year }}</p>
      </a>
    </div>

  </ion-content>
</ion-view>
```

In `www/templates/menu.html`, add the following:

```html
        <ion-item menu-close href="#/app/movies">
          Search Movies
        </ion-item>
```

#### Viewing a single movie

In `www/js/app.js`,

```js
...

  .state('app.singleMovie', {
    url: '/movies/:id',
    views: {
      'menuContent': {
        templateUrl: 'templates/movies-show.html',
        controller: 'MovieShowCtrl'
      }
    }
  });
```

In `www/js/controllers.js`,

```js
angular.module('starter.controllers', [])

...

.controller('MovieShowCtrl', function($scope, $stateParams, $http) {
  $http.get('http://localhost:3000/movies/' + $stateParams.id).success(function(response){
    console.log(response);
    $scope.movie = response;
    $scope.ready = true;
  });
})
```

In `www/templates/movies-show.html`,

```html
<ion-view view-title="{{ movie.Title }}">
  <ion-content>

    <ion-spinner icon="spiral" ng-show="!ready" class="center"></ion-spinner>

    <div class="list card" ng-show="ready">
      <div class="item">
        <h2>{{ movie.Title }}</h2>
        <p>{{ movie.Year }}</p>
      </div>

      <div class="item item-image">
        <img ng-src="{{ movie.Poster }}">
      </div>

      <div class="item item-body">
        <ul class="list">
          <li class="item">
            Released: {{ movie.Released }}
          </li>
          <li class="item">
            Runtime: {{ movie.Runtime }}
          </li>
          <li class="item">
            Genre: {{ movie.Genre }}
          </li>
          <li class="item">
            Director: {{ movie.Director }}
          </li>
          <li class="item">
            Actor: {{ movie.Actor }}
          </li>
          <li class="item">
            Plot: {{ movie.Plot }}
          </li>
          <li class="item">
            Language: {{ movie.Language }}
          </li>
          <li class="item">
            Country: {{ movie.Country }}
          </li>
        </ul>
      </div>

      <div class="item tabs tabs-secondary tabs-icon-left">
        <a class="tab-item">
          <i class="icon ion-thumbsup"></i>
          Like
        </a>
        <a class="tab-item" href="#">
          <i class="icon ion-share"></i>
          Share
        </a>
      </div>
    </div>

  </ion-content>
</ion-view>
```