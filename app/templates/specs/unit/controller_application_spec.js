'use strict';

describe('Controller: ApplicationController', function() {
  var $scope, createController, ctrl;

  beforeEach(module('<%= namespace %>'));
  beforeEach(
    inject(function($injector) {
      var $controller, $rootScope;
      $rootScope = $injector.get('$rootScope');
      $controller = $injector.get('$controller');
      $scope = $rootScope.$new();

      createController = function() {
        ctrl = $controller('ApplicationController', {
          '$scope': $scope
        });
      };
    })
  );

  describe('#init', function(){
    it('should call console.log', function(){
      createController();
      expect($scope.log).toBeDefined();
    });
  });
});
