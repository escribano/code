fs = require 'fs'
Path = require 'path'
#require "#{process.cwd()}/lib/meta/lib/scaffold"
#{to} = require "#{process.cwd()}/lib/meta/lib/base/router_dsl"
#{level} = require "#{process.cwd()}/app/lib/security"
#{to} = require("meta").dsl.router

#Router = require("meta").DSL.Router
#sec = require "#{process.cwd()}/app/lib/security"

module.exports = ->
  #app = @
  #router = new Router(@)
  
  directory = __dirname
  #directory = @set 'routes path'
  options={}
    
  options.loadItem    ||= require
  options.nameToKey   ||= (name) -> name .split('.')[0] .replace(/_*\W+_*/g, '_')
  options.readdirSync ||= (path) -> fs.readdirSync(path)
  options.isDirectory ||= (path) -> fs.lstatSync(path).isDirectory()
  options.filter      ||= (name, names) -> name.match(/\.js$/) or (name.match(/\.coffee$/) and not (name.replace(/\.coffee$/, '.js') in names))

  names = options.readdirSync(directory)
  for name in names
    continue if name.match(/^[._#]|[#~]$/)
    child = Path.join(directory, name)
    key   = options.nameToKey(name)
    continue if options.isDirectory(child)
    continue if child == __filename
    if options.filter(name, names)
      #options.loadItem(child).call app
      #console.log child
      #require(child).call app, router.to, sec
      require(child).call @ #, router, sec

  
