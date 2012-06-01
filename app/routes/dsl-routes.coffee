#Router = require("meta").DSL.Router
#sec = require "#{process.cwd()}/app/lib/security"
#route = new Router(@)
debug         = require('debug')('code:route')
module.exports = (route) ->
  #console.log @
  #console.log arguments
  #console.log route
  #route = new Router(@)
  
  
  @get '/meta', route.to ->
    @title = "Hello from route function!"
    #@render 'authz/index'
    @res.send {"meta dsl"}
  #return
  
  @get '/meta/cont', route.to 'dsl-controller#welcome'
  
  @namespace '/samples', ->
    @get '/', route.to controller: 'dsl-controller', action: 'welcome'
    
    
  debug '%s done', __filename
  ###
  @get '/', route.to controller: 'samples' 
  @get '/', route.to controller: 'samples/sample-controller'
  @get '/:view', [sec.level 'owner']
    , route.to controller: 'samples/sample-controller', action: 'view'