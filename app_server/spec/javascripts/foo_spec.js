describe('ProvideUsersController', function() {
  beforeEach(inject(function($controller) {
    this.scope = {};

    $controller('ProvideUsersController', { $scope: this.scope});
  }));

  describe('initially', function() {
    it('users is empty', function() {
      expect(this.scope.users.length).toEqual(0);
    });
  });

  describe('#addUser', function() {
    it('adds the user to group of users to query', function() {
      this.scope.newUser = 'caspian311';
      this.scope.addUser();

      expect(this.scope.users.length).toEqual(1);
      expect(this.scope.users[0]).toEqual('caspian311');
    });

    it('clears out the new user', function() {
      this.scope.newUser = 'something';
      this.scope.addUser();

      expect(this.scope.newUser).toEqual('');
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
