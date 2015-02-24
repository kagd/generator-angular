'use strict'

module.exports.tasks =
  protractor_webdriver:
    e2eUpdate: options:
      path: './node_modules/.bin/'
      command: 'webdriver-manager update --standalone'

    e2eStart: options:
      path: './node_modules/.bin/'
      command: 'webdriver-manager start'

  protractor:
    options:
      configFile: 'protractor.conf.js'
      keepAlive: false
      noColor: false
      args: {}
    e2e: options:
      configFile: 'protractor.conf.js'
      args: {}
