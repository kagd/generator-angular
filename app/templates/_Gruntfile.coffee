module.exports = (grunt) ->
  path = require('path')

  # Load grunt tasks automatically
  require('load-grunt-tasks')(grunt)

  #///     PATHS     /////
  options =
    pkg: grunt.file.readJSON('package.json')

    config:
      src: path.join(process.cwd(), "grunt-configs/*")

    paths:

      source:
        root: 'src'
        js: 'src/coffee'
        scss: 'src/scss'
        bower: 'bower_components'

      build:
        root: 'build'
        assets: 'build/assets'
        css: 'build/assets/css'
        fonts: 'build/assets/fonts'
        images: 'build/assets/images'
        js: 'build/assets/js'
        vendor: 'build/vendor'

      dist:
        root: 'dist'
        assets: 'dist/assets'
        css: 'dist/assets/css'
        fonts: 'dist/assets/fonts'
        images: 'dist/assets/images'
        js: 'dist/assets/js'
        vendor: 'dist/vendor'

  # Load grunt configuration automatically
  configs = require('load-grunt-configs')(grunt, options);

  # Define the configuration for all tasks
  grunt.initConfig configs

  #///     TEST TASKS     /////
  grunt.registerTask 'build', [
    'clean:build'
    'bower:build'
    'coffee:build'
    'copy:build'
    'compass:build'
    'injector:buildJs'
    'injector:buildCss'
  ]

  grunt.registerTask 'spec', 'build and run unit specs', ->
    grunt.task.run [
      'build'
      'karma'
    ]

  grunt.registerTask 'e2e', 'build and run end-to-end tests', ->
    grunt.task.run [
      'build'
      'protractor_webdriver:e2eStart'
      'protractor:e2e'
    ]

  #///     RELEASE TASKS     /////
  grunt.registerTask 'release', [
    'clean:dist'
    'bower:dist'
    'coffee:dist'
    'copy:dist'
    'compass:dist'
    'injector:distJs'
    'injector:distCss'
  ]

  #///     DEVELOPMENT TASK     /////
  grunt.registerTask 'default', [
    'build'
    'connect:build'
    'watch'
  ]
