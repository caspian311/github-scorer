(function() {
  angular.module('scorer').directive('userScores', function() {
    return {
      restrict: 'E',
      templateUrl: 'scorer/users.html',
      controller: 'UserScoresController',
      replace: true,
      link: function(scope, element) {
      }
    };
  });

})();
