(function() {
  angular.module('scorer').controller('ProvideUsersController', ['$scope', ProvideUsersController]);

  function ProvideUsersController($scope) {
    $scope.users = [];

    $scope.disableAddUser = function() {
      return !($scope.newUser && $scope.newUser.replace(/ /g, '') !== '');
    };

    $scope.addUser = function() {
      $scope.users.push($scope.newUser);
      $scope.newUser = '';
    }
  }
})();
