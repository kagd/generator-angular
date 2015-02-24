'use strict'

ApplicationController = ($scope) ->
  init = ->
    $scope.log = 'ApplicationController init called'

  init()

@<%= namespace %>.controller 'ApplicationController', ApplicationController
ApplicationController.$inject = [
  '$scope'
]
