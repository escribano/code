fs = require 'fs'
path = require 'path'
Langue = require '../../lib/middle/langue'

module.exports = (app) ->
  
  langue = new Langue
  
  langue.add 'en', path.join(process.cwd(), 'app/locales/en/messages.mo')
  langue.add 'pt', path.join(process.cwd(), 'app/locales/pt/messages.mo')
  
  #langue.set 'pt'
  langue.set 'en'
  
  app.set 'langue', langue
