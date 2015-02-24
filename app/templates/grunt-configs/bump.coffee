'use strict'

module.exports.tasks = {
  bump: {
    options: {
      files: ['package.json'],
      updateConfigs: ['pkg'],
      commit: true,
      commitMessage: 'Version bump: v%VERSION%',
      commitFiles: ['package.json','bower.json'],
      createTag: false,
      tagName: 'v%VERSION%',
      tagMessage: 'Version %VERSION%',
      push: false,
      gitDescribeOptions: '',
      globalReplace: false
    }
  }
}
