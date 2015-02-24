'use strict'

module.exports = (grunt, options) ->
  return {
    build: options.paths.build.root
    dist: options.paths.dist.root
  }
