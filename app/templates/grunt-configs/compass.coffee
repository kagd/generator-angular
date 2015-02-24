'use strict'

module.exports = (grunt, options) ->
  return {
    build:
      options:
        cssDir: options.paths.build.css
        fontsDir: options.paths.build.fonts
        httpPath: '/'
        imagesDir: options.paths.build.images
        javascriptsDir: options.paths.build.js
        outputStyle: 'compressed'
        raw: 'preferred_syntax = :sass\n'
        sassDir: options.paths.source.scss

    dist:
      options:
        cssDir: options.paths.dist.css
        fontsDir: options.paths.dist.fonts
        httpPath: '/'
        imagesDir: options.paths.dist.images
        javascriptsDir: options.paths.dist.js
        outputStyle: 'compressed'
        raw: 'preferred_syntax = :sass\n'
        sassDir: options.paths.source.scss
  }
