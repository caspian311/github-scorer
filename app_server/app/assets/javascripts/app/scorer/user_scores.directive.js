(function() {
  angular.module('scorer').directive('userScores', function() {
    return {
      restrict: 'E',
      templateUrl: 'scorer/user_scores.html',
      replace: true,
      link: function(scope, element) {
      }
    };
  });

})();
