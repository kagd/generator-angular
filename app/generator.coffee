yeoman = require('yeoman-generator')
chalk = require('chalk')
yosay = require('yosay')

module.exports = yeoman.generators.Base.extend(
  initializing: ->
    @pkg = require('../package.json')

  prompting: ->
    done = @async()
    @opts =
      appName: @appname
      useFoundation: true
      useJQuery: true
      useScheming: false
      useNormalize: true

    # Have Yeoman greet the user.
    @log yosay('Welcome to the astonishing ' + chalk.red('Angular') + ' generator!')

    capitalize = (word) ->
      word.charAt(0).toUpperCase() + word.slice(1)

    titleize = (string) ->
      cleanTitle = string.replace(/[ \-_]+/g, ' ')
      words = cleanTitle.replace(/([A-Z])/g, " $&").trim().split(' ')
      capitalizedWords = words.map (word) ->
        capitalize(word)
      capitalizedWords.join(' ')

    prompts = [
      {
        type: 'input'
        name: 'appName'
        message: 'What is the name of this project? Please capitalize.'
        default: @opts.appName
      }
      {
        type: 'confirm'
        name: 'useFoundation'
        message: 'Include Foundation?'
        default: @opts.useFoundation
      }
      {
        type: 'confirm'
        name: 'useScheming'
        message: 'Include Scheming for JS models? (https://github.com/autoric/scheming)'
        default: @opts.useScheming
      }
    ]

    @prompt prompts, ((props) ->
      @opts.appName = titleize(props.appName)
      @opts.namespace = @opts.appName.replace(/\s+/g, '')
      @opts.appDirectory = @opts.appName.replace(/\s+/g, '_').toLowerCase()

      @opts.useScheming = props.useScheming
      @opts.useFoundation = props.useFoundation
      @opts.useNormalize = !@opts.useFoundation

      extraPrompts = [
        {
          type: 'confirm'
          name: 'useJQuery'
          message: 'Include jQuery?'
          default: @opts.useJQuery
        }
      ]

      if !@opts.useFoundation
        @prompt extraPrompts, ((props) ->
          @opts.useJQuery = props.useJQuery
          done()
        ).bind(this)
      else
        done()

    ).bind(this)


  writing:
    copy: ->
      @fs.copy @templatePath("_Gruntfile.coffee"), @destinationPath("#{@opts.appDirectory}/Gruntfile.coffee")

      systemFiles = ['editorconfig', 'jshintrc', 'gitignore']

      systemFiles.forEach (file) =>
        @fs.copy @templatePath(file), @destinationPath("#{@opts.appDirectory}/.#{file}")

      @fs.copy @templatePath("src/scss/**/*"), @destinationPath("#{@opts.appDirectory}/src/scss")

    template: ->
      templateFiles = ['package.json', 'bower.json']

      templateFiles.forEach (file) =>
        @fs.copyTpl @templatePath("_#{file}"), @destinationPath("#{@opts.appDirectory}/#{file}"), @opts

      @fs.copyTpl @templatePath("grunt-configs/*"), @destinationPath("#{@opts.appDirectory}/grunt-configs"), @opts
      @fs.copyTpl @templatePath("src/coffee/app.coffee"), @destinationPath("#{@opts.appDirectory}/src/coffee/#{@opts.appDirectory}.coffee"), @opts
      @fs.copyTpl @templatePath("src/coffee/controller_application.coffee"), @destinationPath("#{@opts.appDirectory}/src/coffee/controller_application.coffee"), @opts
      @fs.copyTpl @templatePath("specs/**/*"), @destinationPath("#{@opts.appDirectory}/specs"), @opts
      @fs.copyTpl @templatePath("src/**/*.html"), @destinationPath("#{@opts.appDirectory}/src"), @opts

  install: ->
    process.chdir("#{@opts.appDirectory}");

    @installDependencies
      skipInstall: @options['skip-install']

)
