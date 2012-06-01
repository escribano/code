# config/routes.coffee
module.exports = (route, sec) ->
  
  app.Route.draw ->
    
    @match "/blog", "bootcalling/blog", via: "get", as: "blog"
    @match "/blog/tag/:tag", "bootcalling/blog#list", via: "get", as: "blog-tag"
    
    @get '/', route.to controller: 'bootcalling/blog', action: 'list'
    @get '/', route.to controller: 'bootcalling/blog', action: 'list'
    @get '/', {as: 'bla'}, route.to controller: 'bootcalling/blog', action: 'list'
    
    @get '/', route.to controller: 'bootcalling/blog', action: 'list'
    
    match 'path', name 'alias', 
    
    
    @match "/login", "sessions#new", via: "get", as: "login"
    @match "/logout", "sessions#destroy", via: "get", as: "logout"
    
    @namespace '/blog', ->
      @get '/', route.to controller: 'bootcalling/blog', action: 'list'
      @get '/tag/:tag', route.to controller: 'bootcalling/blog', action: 'list'
      @get '/view/:identifier', route.to controller: 'bootcalling/blog', action: 'view'

    @resources "posts", ->
      @resources "comments"

    @namespace "admin", ->
      @resources "users"
      @resources "posts", ->
        @resources "comments"

    @constraints subdomain: /^api$/, ->
      @resources "posts", ->
        @resources "comments"

    @match "(/*path)", to: "application#index", via: "get"
  
    registry = require "../../lib/registry"

    urlPrefix = registry.getApp().set('config').urlPrefix



    @namespace '/'+urlPrefix, ->
      @get '/', route.to controller: 'bootcalling'
      # @get '/view/:identifier', route.to controller: 'bootcalling/view'

      @namespace '/blog', ->
        @get '/', route.to controller: 'bootcalling/blog', action: 'list'
        @get '/tag/:tag', route.to controller: 'bootcalling/blog', action: 'list'
        @get '/view/:identifier', route.to controller: 'bootcalling/blog', action: 'view'

      @namespace '/project', ->
      	@get '/:library', route.to controller: 'bootcalling/project', action: 'list'

      @namespace '/events', ->
        @get '/', route.to controller: 'bootcalling/events'
        @get '/:event', route.to controller: 'bootcalling/events', action: 'view'

      @namespace '/explore', ->
      	@get '/', route.to controller: 'bootcalling/explore', action: 'index'
      	@get '/images', route.to controller: 'bootcalling/explore', action: 'images'
      	@get '/albums', route.to controller: 'bootcalling/explore', action: 'albums'
      	@get '/videos', route.to controller: 'bootcalling/explore', action: 'videos'
      	@get '/documents', route.to controller: 'bootcalling/explore', action: 'documents'

      @namespace '/search', ->
        @get '/', route.to controller: 'bootcalling/search', action: 'index'

      @namespace '/page', ->
        @get '/:view', route.to controller: 'bootcalling', action: 'view'
  