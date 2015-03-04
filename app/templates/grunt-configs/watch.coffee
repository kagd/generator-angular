'use strict'

module.exports = (grunt, options) ->

  return {
    buildJs:
      files: [
        "#{options.paths.build.js}/**/*.js"
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

    buildCoffee:
      files: [
        "#{options.paths.source.js}/**/*.coffee"
      ]
      tasks: [ 'coffee:build' ]

    buildHtml:
      files: [
        "#{options.paths.source.root}/**/*.html"
      ]
      tasks: [
        'copy:build'
      ]

    build:
      options:
        livereload: options.connect.build

      files: [
        "#{options.paths.build.root}/**/*"
      ]

  }
