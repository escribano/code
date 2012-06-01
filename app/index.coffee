"use strict"
###########

###
 *  Load dependencies
###

debug         = require('debug')('code:app')
express       = require('express')
settings      = require('./config/settings')
engine        = require('./config/engine')
tree          = require './lib/applyfiles'

express3 = express.version.split('.')[0] == '3'
#app = module.exports = express()
app = express() if express3
app = express.createServer() unless express3
app.set 'express3', express3

debug('booting in %s mode', app.get('env'))

#debug('before namespace')
namespace = require './lib/namespace'
namespace(app) if express3

debug('namespace applied')

settings.call app
engine.call app

debug('config done')

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
  app.use express.logger 'dev'
  #console.log "#{fg.green 'this is green on white'} and #{fg.magenta 'this is magenta on white'}"
  #app.use(express.logger('  :method :url :response-time :status'))
  #app.use(express.logger("  #{fg.green ':method '}  #{fg.yellow ':url '} #{fg.blue ':response-time '} #{fg.gray ':status '}"))
  ###
  {fg, bg, bright} = require '../lib/ansicode'
  app.use express.logger                \
      "#{fg.green   ':method '}"        \
    + "#{fg.yellow  ':url '}"           \
    + "#{bright fg.blue ':response-time '}" \ 
    + "#{fg.gray    ':status '}"
  ###
app.configure 'test', ->
  app.use(express.logger(':method :url :status'))
app.configure 'production', ->
  app.use express.logger()
  
# favicon
app.use express.favicon()

debug('basic middleware done')

# Locals
#require('./locals').call app
#mods = tree.createApiTree app.settings['locals path']
#for mod in mods
#  require(mod).call app
if app.settings['express3']
  for mod in tree.createApiTree app.settings['locals path']
    #console.log route
    require(mod).call app
    
debug('locals done')


# routes
app.use app.router
#require('./routes').call app
#mods = tree.createApiTree app.settings['routes path']
#for mod in mods
#  require(mod).call app
debug('acquiring router')
Router = require("meta").DSL.Router
debug('router acquired')

route = new Router(app)

for mod in tree.createApiTree app.settings['routes path']
  debug('routing...')
  (require(mod).call app, route) 
  
debug('routes done')
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


Middle = require '../lib/assets'
middle = new Middle
  src: "#{process.cwd()}/app/assets/src"
#middle = new Middle(
#  lib: "#{process.cwd()}/app/middle/lib/bootstrap/less"
#)
app.use middle.middleware()


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

debug('app ready')

exports = module.exports = app
#exports.version = require('../package').version

###
if (!module.parent) {
  process.title = 'marked';
  main(process.argv.slice());
} else {
  module.exports = main;
}
###

