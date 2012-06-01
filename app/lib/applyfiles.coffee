fs = require 'fs'
Path = require 'path'

exports.createApiTree = createApiTree =(directory, options={})->

  options.loadItem    ||= require
  options.nameToKey   ||= (name) -> name .split('.')[0] .replace(/_*\W+_*/g, '_')
  options.readdirSync ||= (path) -> fs.readdirSync(path)
  options.isDirectory ||= (path) -> fs.lstatSync(path).isDirectory()
  options.filter      ||= (name, names) -> name.match(/\.js$/) or (name.match(/\.coffee$/) and not (name.replace(/\.coffee$/, '.js') in names))

  tree = {}
  modules = []

  #console.log directory
  
  names = options.readdirSync(directory)
  for name in names

    continue if name.match(/^[._#]|[#~]$/)

    child = Path.join(directory, name)
    continue if child == __filename
    key   = options.nameToKey(name)
    
    
    ###
    #continue if options.isDirectory(child)
    item = if options.isDirectory(child)
    #if options.isDirectory(child)
      createApiTree(child, options)
    else if options.filter(name, names)
      options.loadItem(child)
      #console.log child
      #child
    ###
    if options.isDirectory(child)
      createApiTree(child, options)
    else if options.filter(name, names)
      modules.push child
    
    #if item && Object.keys(item).length  # avoid empty nodes

    ###
    if options.filter(name, names)
      #options.loadItem(child).call app
      #console.log child
      #require(child).call app, router.to, sec
      require(child).call @ #, router, sec
    ###
      
  #return tree
  return modules

  
