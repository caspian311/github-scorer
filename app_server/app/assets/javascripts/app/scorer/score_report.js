(function() {
  angular.module('scorer').factory('ScoreReport', ['railsResourceFactory', ScoreReport]);

  function ScoreReport(railsResourceFactory) {
    return railsResourceFactory({
      url: '/api/scores',
      name: 'scoreReport'
    });
  }
})();
