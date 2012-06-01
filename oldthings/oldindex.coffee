
express       = require 'express'

#require 'express-resource'
#require 'express-namespace'

#settings      = require('./settings')
config        = require './config'

expressVersion = 3
if expressVersion == 3
  app = express()
  #require "#{process.cwd()}/lib/namespace"
else
  app = express.createServer()
  #require 'express-namespace'

#settings.call app

#config(app)

config.call app

module.exports = app
