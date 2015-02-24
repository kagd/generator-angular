'use strict'

module.exports = (grunt, options) ->

  return {
    buildJs:
      files: [
        "#{options.paths.source.js}/**/*.js"
      ]
      tasks: [ 'injector:buildJs' ]

    buildCss:
      files: [
        "#{options.paths.source.scss}/**/*.scss"
      ]
      tasks: [
        'compass:build'
        'injector:buildCss'
      ]

    build:
      options:
        livereload: options.connect.build

      files: [
        "#{options.paths.build.root}/**/*"
      ]

  }
