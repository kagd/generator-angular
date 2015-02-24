'use strict'

module.exports = (grunt, options) ->
  return {
    build:
      files: [
        {
          expand: true
          cwd: options.paths.source.root
          src: ['**/*.html']
          dest: options.paths.build.root
        }
      ]

    dist:
      files: [
        {
          expand: true
          cwd: options.paths.source.root
          src: ['**/*.html']
          dest: options.paths.dist.root
        }
      ]
  }
