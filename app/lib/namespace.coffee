express       = require('express')
join = require("path").join

module.exports = (app) ->
  
  #, Router = require('./router')
  #, methods = Router.methods.concat('del', 'all')

  proto = {}
  proto.namespace = ->
    args = Array.apply(null, arguments)
    path = args.shift()
    #console.log path
    fn = args.pop()
    self = this
    self.all path + "*", args  if args.length
    (@_ns = @_ns or []).push path
    #console.log this
    fn.call this
    @_ns.pop()
    this
  
  proto.__defineGetter__ "currentNamespace", ->
    #join.apply(this, @_ns).replace(/\\/g, "/").replace(/\/$/, "") or "/"
    join.apply(this, @_ns).replace("/\\/g", "/").replace("/\/$/", "") or "/"

  ###
  methods.forEach (method) ->
    app[method] = (path) ->
      return @set(path)  if "get" is method and 1 is arguments_.length
      args = [ method ].concat([].slice.call(arguments_))
      @use @router  unless @_usedRouter
      @_router.route.apply @_router, args
  ###
  ###
  ###
  # * Delegate `.VERB(...)` calls to `.route(VERB, ...)`.
  ###

  methods.concat('all').forEach(function(method){
    app[method] = function(path){
      if ('get' == method && 1 == arguments.length) return this.set(path); 
      var self = this;
      var fns = [].slice.call(arguments, 1);

      fns.forEach(function(fn){
        self.route(method.toUpperCase(), path, fn);
      });

      return this;
    };
  });
  ###

  #express.router.methods.concat("del").forEach (method) ->
  #express.methods
  #express.Route
  express.Router.methods.concat("del", 'all').forEach (method) ->
    #orig = HTTPServer::[method]
    #orig = express.application[method]
    orig = app[method]
    #console.log method
    proto[method] = ->
      args = Array::slice.call(arguments)
      #args = [ method ].concat([].slice.call(arguments))
      path = args.shift()
      return @set(path)  if "get" is method and 1 is arguments.length
      @use @router  unless @_usedRouter
      fn = args.pop()
      self = this
      @namespace path, ->
        curr = @currentNamespace
        args.forEach (fn) ->
          fn.namespace = curr
          orig.call self, curr, fn
        fn.namespace = curr #if fn
        orig.call self, curr, fn

      this

  ###
  for key of proto
    desc = Object.getOwnPropertyDescriptor(proto, key)
    Object.defineProperty express.application::__proto__, key, desc
  #console.log proto.currentNamespace
  ###



  for key of proto
    desc = Object.getOwnPropertyDescriptor(proto, key)
    Object.defineProperty app, key, desc
  
  
  #console.log app.currentNamespace
  #console.log app::
  #console.log express
  #process.exit()
  ###
  app.namespace = ->
    args = Array.apply(null, arguments)
    path = args.shift()
    fn = args.pop()
    self = this
    self.all path + "*", args  if args.length
    (@_ns = @_ns or []).push path
    fn.call this
    @_ns.pop()
    this
  
  app::__defineGetter__ "currentNamespace", ->
    #join.apply(this, @_ns).replace(/\\/g, "/").replace(/\/$/, "") or "/"
    #join.apply(this, @_ns).replace("/\\/g", "/").replace("/\/$/", "") or "/"
    'blah'


  console.log app.currentNamespace
  process.exit()

  #console.log app.router()
  express.Router.methods.concat("del").forEach (method) ->
    #console.log method
    orig = app[method]
    #console.log orig
    app[method] = ->
      args = Array::slice.call(arguments)
      path = args.shift()
      fn = args.pop()
      self = this
      @namespace path, ->
        curr = @currentNamespace
        args.forEach (fn) ->
          fn.namespace = curr
          orig.call self, curr, fn

        fn.namespace = curr
        orig.call self, curr, fn

      this

  #express.Router.methods.concat("del").forEach (method) ->
  app.router.methods.concat("del").forEach (method) ->
    #orig = HTTPServer::[method]
    orig = express::[method]

    app[method] = ->
      args = Array::slice.call(arguments)
      path = args.shift()
      fn = args.pop()
      self = this
      @namespace path, ->
        curr = @currentNamespace
        args.forEach (fn) ->
          fn.namespace = curr
          orig.call self, curr, fn

        fn.namespace = curr
        orig.call self, curr, fn

      this
  ###

    
  #console.log express.Router
  #console.log app
  #process.exit()