module.exports = function(config) {
  config.set({
    basePath: '../',
    frameworks: ['jasmine'],
    files: [
      // Load Vendor Files
      'build/vendor/angular/*.js',
      'build/vendor/angular-mocks/*.js',
      <% if(useFoundation || useJQuery) { %>'build/vendor/jquery/*.js',<% } %>
      <% if(useFoundation) { %>'build/vendor/foundation/*.js',<% } %>

      // Load modules needed by the app
      // 'build/assets/js/modules/*.js',

      // App files
      'build/assets/js/<%= appDirectory %>.js',
      'build/assets/js/**/*.js',
      'build/assets/js/**/*.html',

      // Spec helpers
      // 'specs/helpers/**/*.{js,json}',

      // Spec files
      'specs/unit/**/*_spec.js'
    ],
    exclude: [],
    port: 8080,
    logLevel: config.LOG_INFO,
    browsers: [
      'Chrome'
    ],
    plugins: [
      'karma-chrome-launcher',
      'karma-jasmine',
      'karma-ng-html2js-preprocessor'
    ],
    autoWatch: true,
    singleRun: false,
    colors: true,
    client: {
      captureConsole: true
    },
    preprocessors: {
      'build/assets/js/**/*.html':['ng-html2js']
    },
    ngHtml2JsPreprocessor: {
      // If your build process changes the path to your templates,
      // use stripPrefix and prependPrefix to adjust it.
      // stripPrefix: "source/path/to/templates/.*/",
      prependPrefix: "/",

      // the name of the Angular module to create
      moduleName: "templates"
    }
  });
};
