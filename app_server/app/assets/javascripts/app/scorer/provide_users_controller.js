(function() {
  angular.module('scorer').controller('ProvideUsersController', ['$scope', 'ScoreReport', ProvideUsersController]);

  function ProvideUsersController($scope, ScoreReport) {
    $scope.users = [];

    $scope.disableAddUser = function() {
      return !($scope.newUser && $scope.newUser.replace(/ /g, '') !== '');
    };

    $scope.addUser = function() {
      if ($scope.newUser && $scope.newUser != '') {
        $scope.users.push($scope.newUser);
      }
      $scope.newUser = '';
      ScoreReport.query({ 'users[]': $scope.users }).then(function(data) {
        $scope.scoreReport = data;
      }, function(error) {
        $scope.error = error.data.error_message;
      });
    }
  }
})();
