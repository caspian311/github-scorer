(function() {
  angular.module('scorer').directive('errorMessage', function() {
    return {
      restrict: 'E',
      templateUrl: 'scorer/error_message.html',
      replace: true,
      link: function(scope, element) {
      }
    };
  });

})();

