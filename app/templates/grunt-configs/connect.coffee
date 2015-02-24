'use strict'

module.exports = (grunt, params) ->
  return {
    options:
      hostname : 'localhost'
      open: true
      port: 8080

    build:
      options:
        base: 'build'
        livereload: 35729

    dist:
      options:
        base: 'dist'
        keepalive: true
        livereload: false
  }
