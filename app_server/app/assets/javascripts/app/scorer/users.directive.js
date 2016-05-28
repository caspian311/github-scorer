(function() {
  angular.module('scorer').directive('users', function() {
    return {
      restrict: 'E',
      templateUrl: 'scorer/users.html',
      controller: 'UsersController',
      replace: true,
      scope: {},
      link: function(scope, element) {
      }
    };
  });

})();
