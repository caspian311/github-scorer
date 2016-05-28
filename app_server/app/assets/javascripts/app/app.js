(function() {
  var app = angular.module('GithubScorer', ['ngRoute', 'scorer']);

  app.config(['$httpProvider', '$locationProvider', '$routeProvider', appConfig]);

  function appConfig($httpProvider, $locationProvider, $routeProvider) {
    $routeProvider.otherwise({ redirectTo: '/providerUsers' });

    $httpProvider.defaults.headers.common['X-CSRF-Token'] = 
      angular.element("meta[name=csrf-token]").attr("content");
  }
})();
