(function() {
  angular.module('scorer').controller('UsersController', ['$scope', UsersController]);


  function UsersController($scope) {
    $scope.users = 'monkey';
  }

})();
