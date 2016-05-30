(function() {
  var module = angular.module('scorer', ['templates', 'ngRoute', 'rails']);

  module.config(['$routeProvider', moduleConfig]);

  function moduleConfig($routeProvider) {
    $routeProvider.
      when('/providerUsers', {
        controller: 'ProvideUsersController',
        templateUrl: 'pages/provide_users.html'
      });
  };

})();

