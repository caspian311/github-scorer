(function() {
  var app = angular.module('GithubScorer', ['scorer']);

  app.config(["$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = 
      angular.element("meta[name=csrf-token]").attr("content");
  }]);
})();
