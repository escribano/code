path = require 'path'

module.exports = ->
  #config = require "#{process.cwd()}/app/lib/configure"
  #@set 'controllers path', __dirname + '/controllers'
  
  cwd = path.join process.cwd()
  appPath = path.join cwd, 'app'
  config =
    appPaths : 
      public : path.join appPath, 'public'
      views :  path.join appPath, "views"
      app : path.join cwd, "app"
      controllers : path.join cwd,"app","controllers"
      models : path.join cwd,"app","models"
      routes : path.join cwd,"app","routes"

    configFile : path.join cwd, 'config.cson'
    #environment : process.env.NODE_ENV or @settings.env
    environment : process.env.NODE_ENV or 'development'
    
  @set 'controllers path', config.appPaths.controllers
  @set 'routes path', config.appPaths.routes
  @set 'locals path', path.join cwd,"app","locals"
  @set 'views path', config.appPaths.views
  @set 'static path', config.appPaths.public
  @set 'use layout', false
  @set 'session store', 'default'
  @set 'error handling', false
  
  #package_json = require "#{cwd}/package.json"
  pkg = require("#{cwd}/package.json")
  @set 'app version', pkg.version
  @set 'app name', pkg.name
  
  # views stuff
  @set('title', 'spcalling')         
  
  # set default layout, usually "layout"
  # app.locals.layout = 'layouts/default';

  
  #@set 'config', config


