(function() {
  beforeEach(module('GithubScorer'));

  afterEach(function() {
    this.http.resetExpectations();
    this.http.verifyNoOutstandingExpectation();
    this.http.verifyNoOutstandingRequest();
  });
})();
