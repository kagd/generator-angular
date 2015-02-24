# generator-angular

Yeoman generator for base Angular.js setup

## Quickstart

**NOTE:** This generator will conflict with the [Yeoman angular generator](https://github.com/yeoman/generator-angular) since it uses the same namespace.

```bash
npm install -g yo
```

Install this generator

```bash
git clone git@github.com:kagd/generator-angular.git
```

Install dependencies

```bash
npm install
```

Link the generator to the `yo` command

```bash
npm link
```

Finally, initiate the generator in your destination directory:

```bash
yo angular
```

## What does the generator install?

#### Automatic installs
 - Angular.js
 - normalize.css
 - base angular app setup

#### Optional installs
 - Foundation
 - jQuery
 - [scheming](https://github.com/autoric/scheming).

When you run the generator, you will be prompted for a project name. This will create the directory and setup the namespace for the app.

## The generated Angular.js app

### Grunt tasks

```bash
grunt
```

The default `grunt` task will execute:
 - clean the build directory
 - move bower dependencies into vendor directory under build dir
 - compile coffeescript files into build dir
 - copy html files into build dir
 - compile scss files into build dir
 - inject all vendor and project js and css into index.html under the build dir
 - start the server
 - watch for js and css changes

```bash
grunt release
```

The `grunt release` task will execute:
 - clean the dist directory
 - move bower dependencies into vendor directory under dist dir
 - compile coffeescript files into dist dir
 - copy html files into dist dir
 - compile scss files into dist dir
 - inject all vendor and project js and css into index.html under the dist dir

```bash
grunt connect:dist
```

This will run the server against the compiled dist files.

```bash
grunt spec
```

This will run all unit specs with Karma.js against chrome.
