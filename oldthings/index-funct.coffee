"use strict"

###########

###
 *  Load dependencies
###

express       = require('express')
settings      = require('./config/settings')
engine        = require('./config/engine')
tree = require './lib/applyfiles'
join = require("path").join

express3 = express.version.split('.')[0] == '3'
#console.log express3

#console.log express.Router
#process.exit()
#require './lib/namespace' # if express3


#app = module.exports = express()
app = express() if express3

app = express.createServer() unless express3
app.set 'express3', express3


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

#express.router.methods.concat("del").forEach (method) ->
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
  
settings.call app
engine.call app

#app.use express.bodyDecoder()
# bodyParser should be above methodOverride
app.use express.bodyParser()
app.use express.methodOverride()

# session suport
# cookieParser should be above session
app.use express.cookieParser("0123456789") if app.settings['express3']
app.use express.session() if app.settings['express3']
#  secret: "0123456789"
# add req.session cookie support
#app.use express.cookieSessions()


# Per environment configuration
app.configure 'development', 'local', ->
  #app.use(express.logger('  \033[90m:method\033[0m \033[36m:url\033[0m \033[90m:response-time\033[0m \033[90m:status\033[0m'))
  # Removed escaped characters from log message, because violate 'use strict'
  app.use(express.logger('  :method :url :response-time :status'))
app.configure 'test', ->
  app.use(express.logger(':method :url :status'))
app.configure 'production', ->
  app.use express.logger()
  
# favicon
app.use express.favicon()

# Locals
#require('./locals').call app
#mods = tree.createApiTree app.settings['locals path']
#for mod in mods
#  require(mod).call app
(require(mod).call app) for mod in tree.createApiTree app.settings['locals path'] if app.settings['express3']

app.use app.router

# routes
#require('./routes').call app
#mods = tree.createApiTree app.settings['routes path']
#for mod in mods
#  require(mod).call app
(require(mod).call app) for mod in tree.createApiTree app.settings['routes path']
#dslroutes = require('./routes/dsl-routes')
#dslroutes.call app
#console.log dslroutes.toString()
#console.log app
#dslroutes.call app

app.use express.static(app.set 'static path')

# dynamic and static
# helpers
# helpers app
# app.helpers require('./helpers')
#require('./helpers').call app

# per configuration
# error handling
app.configure 'development', 'local', 'stage', 'test', ->
  if app.set 'error handling'
    errors app
  app.use express.errorHandler(dumpExceptions: true, showStack: true)
app.configure 'production', ->
  #oneYear = 31557600000
  #gzippo = require('gzippo')
  #@use(gzippo.staticGzip(o.paths.root, { maxAge: oneYear }))
  app.use express.errorHandler()

#return app

exports = module.exports = app
###
if (!module.parent) {
  process.title = 'marked';
  main(process.argv.slice());
} else {
  module.exports = main;
}
###

