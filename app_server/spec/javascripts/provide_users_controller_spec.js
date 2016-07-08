describe('ProvideUsersController', function() {
  beforeEach(inject(function($controller, _$httpBackend_) {
    this.scope = {};
    this.http = _$httpBackend_;

    $controller('ProvideUsersController', { $scope: this.scope });
  }));

  describe('initially', function() {
    it('users is empty', function() {
      expect(this.scope.users.length).toEqual(0);
    });
  });

  describe('#addUser', function() {
    describe('when success', function() {
      beforeEach(function() {
        this.expectedData = 'expected data';
        this.http.whenGET(/\/api\/scores.*/).respond(200, this.expectedData);
        this.http.expectGET(/\/api\/scores.*/);
        this.scope.newUser = 'caspian311';
      });

      it('adds the user to group of users to query', function() {
        this.scope.addUser();
        this.http.flush();

        expect(this.scope.users.length).toEqual(1);
        expect(this.scope.users[0]).toEqual('caspian311');
      });

      it('clears out the new user', function() {
        this.scope.addUser();
        this.http.flush();

        expect(this.scope.newUser).toEqual('');
      });
      
      it('populates the scoreReport based on data returned', function() {
        this.scope.addUser();
        this.http.flush();

        expect(this.scope.scoreReport).toEqual(this.expectedData);
      });
    });

    it('queries the backend with the correct users', function() {
      this.http.whenGET(/\/api\/scores.*/).respond(200, '');
      this.http.expectGET('/api/scores?users%5B%5D=first&users%5B%5D=second&users%5B%5D=third');

      this.scope.users = ['first', 'second', 'third'];

      this.scope.addUser();
      this.http.flush();

      expect(this.scope.scoreReport).not.toEqual(undefined)
    });

    describe('something went wrong', function() {
      beforeEach(function() {
        this.errorMessage = 'expected error message';
        this.http.whenGET(/\/api\/scores.*/).respond(404, { 'error_message': this.errorMessage });
        this.http.expectGET('/api/scores?users%5B%5D=somethingelse');
      });

      it('shows an error', function() {
        this.scope.users = ['somethingelse'];

        this.scope.addUser();
        this.http.flush();

        expect(this.scope.scoreReport).toEqual(undefined);
        expect(this.scope.error).toEqual(this.errorMessage);
      });
    });

    describe('previous run failed', function() {
      beforeEach(function() {
        this.scope.error = 'something bad';
      });

      it('hide error', function() {
        var data = 'expected data';
        this.http.whenGET(/\/api\/scores.*/).respond(200, data);
        this.http.expectGET('/api/scores?users%5B%5D=foo');

        this.scope.users = ['foo'];

        this.scope.addUser();
        this.http.flush();

        expect(this.scope.error).toEqual(undefined);
      });
    });
  });


  describe('#disableAddUser', function() {
    describe('no new user given', function() {
      it('disables the add user button', function() {
        this.scope.newUser = '';
      
        expect(this.scope.disableAddUser()).toEqual(true);

        this.scope.newUser = ' ';
      
        expect(this.scope.disableAddUser()).toEqual(true);

        this.scope.newUser = undefined;
      
        expect(this.scope.disableAddUser()).toEqual(true);
      });
    });

    describe('new user is given', function() {
      it('enables the add user button', function() {
        this.scope.newUser = 'monkey';
      
        expect(this.scope.disableAddUser()).toEqual(false);
      });
    });
  });
});
