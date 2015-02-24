'use strict'

module.exports = (grunt, options) ->
  path = require('path')
  <% if(useNormalize) { %>
  layout = (type, component, source) ->
    renamedComponent = component
    # if normalize has the .css on the directory, the injector reference
    # the directory as a css file
    if component == 'normalize.css'
      renamedComponent = 'normalize'

    path.join renamedComponent
  <% } %>

  return {
    build:
      options:<% if(useNormalize) { %>
        layout: layout<% } %>
        targetDir: options.paths.build.vendor

    dist:
      options:<% if(useNormalize) { %>
        layout: layout<% } %>
        targetDir: options.paths.dist.vendor
  }
