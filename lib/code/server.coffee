#require 'underscore.logger'

global._ = require 'underscore'
_.mixin(require('underscore.string'))

module.exports  = global.Code = Code = {}

# reads and sets the latest version on startup
Code.version = JSON.parse(require("fs").readFileSync(require("path").normalize("#{__dirname}/../../package.json"))).version

#Tower.logger    = _console

# external libraries, to get around having to use `require` in the browser.
Code.modules =
  #validator:  require 'validator'
  #accounting: require 'accounting'
  moment:     require 'moment'
  #geo:        require 'geolib'
  #inflector:  require 'inflection'
  async:      require 'async'

require './support'
#require './application'
#require './server/application'
#require './store'
#require './server/store'
#require './model'
require './view'
#require './controller'
#require './server/controller'
#require './http'
#require './server/mailer'
#require './middleware'
#require './server/middleware'
#require './server/command'
#require './server/generator'

#Tower.View.store(new Tower.Store.FileSystem(["app/views"]))
Code.root                = process.cwd()
Code.publicPath          = process.cwd() + "/public"
Code.publicCacheDuration = 60 * 1000
#Tower.render              = (string, options = {}) ->
#  require("mint").render(options.type, string, options)

Code.domain              = "localhost"

Code.date = ->
  require('moment')(arguments...)._d

Code.run = (argv) ->
  (new Code.Command.Server(argv)).run()
