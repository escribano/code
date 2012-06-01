fs = require 'fs'
path = require 'path'
async = require 'async'

#Fileproxy = require './fileproxy'
#Cache = require './cache'
mime = require 'mime'
url = require 'url'

debug = require('debug')('lib:assets')

utils = require("./utils")
{parse} = require 'url'

timeEq = (date1, date2) ->
  date1? and date2? and date1.getTime() is date2.getTime()

#
libs = {}
#enable = ['coffee','stylus', 'jade', 'tmpl.jade']
#enable = ['coffee','stylus']

cache = {}

module.exports = class Middle
  constructor: (@options = {}) ->
    #console.log options
    @options.path ?= './assets'
    @options.src ?= path.join process.cwd(), "app", 'middle'
    #@options.lib ?= path.join process.cwd(), "app", 'middle', 'lib'
    
    debug('starting with %s path', @options.src)
    #console.log @options
    #@cache = new Cache
    #@handlers = []
    #@fileproxy = new Fileproxy
  
  ###
  use: (handler) ->
    @handlers.push handler
  
  form: (_extname, _sourceExtname, _compiler) ->
    if typeof _sourceExtname is 'function'
      [_sourceExtname, _compiler] = [null, _sourceExtname]

    @use ({filename, polymorph}, next) ->
      if path.extname(filename) is _extname
        sourceFilename = "#{path.dirname(filename)}/#{path.basename(filename, _extname)}#{_sourceExtname or _extname}"

        compile = (source) ->
          _compiler {source, filename, sourceFilename}, (err, compiled) ->
              throw err if err
              polymorph.cache.set filename, compiled
              next()
        cached = polymorph.cache.cached filename
        if cached.changed()
          compile cached.get()
        else
          polymorph.fileproxy.get sourceFilename, (err, result) ->
            unless err
              {source, changed} = result
              if changed
                compile source
              else
                next()
            else
              next()
      else
        next()
  
  ###
  
  #
  compilers =
    
    'tmpl.jade': 
      match: /\.tmpl\.js$/
      ext: ".tmpl.jade"
      compile: (str, filename, callback) ->
        #console.log 'antes'
        #console.log cache
        jade = cache.jade or (cache.jade = require("jade"))
        #console.log 'depois'
        options = {}
        options =
          #pretty: true
          compileDebug: false
          client: true
          filename: filename
        #console.log options
        #console.log str
        #fnjade = jade.compile(str,options)
        #console.log 'merdamerdamerda'
        #console.log filename
        fnjade = jade.compile str,
          filename: filename
          client: true
          compileDebug: false
        callback null, fnjade.toString()

            
      compile1: (filepath, callback) ->
        libs.jade or= require 'jade'
        fs.readFile filepath, 'utf8', (err, str) ->
          return callback err if err
          try
            options = {}
            options =
              #pretty: true
              compileDebug: false
              client: true
            #console.log options
            #console.log str
            fnjade = libs.jade.compile(str,options)
            callback null, fnjade.toString()
          catch err
            callback err
            


    coffeescript: 
      match: /\.js$/
      ext: ".coffee"
      # { bare: true }
      compile: (str, filename, callback) ->
        coffee = cache.coffee or (cache.coffee = require("coffee-script"))
        callback null, coffee.compile(str)
        #try
        #  fn null, coffee.compile(str)
        #catch err
        #  fn err
      compile1: (str, fn) ->
        coffee = cache.coffee or (cache.coffee = require("coffee-script"))
        try
          fn null, coffee.compile(str)
        catch err
          fn err
      compile2: (filepath, callback) ->
        libs.CoffeeScript or= require 'coffee-script'
        fs.readFile filepath, 'utf8', (err, str) ->
          return callback err if err
          try
            callback null, libs.CoffeeScript.compile str
          catch e
            callback e

    jade: 
      match: /\.html$/
      ext: ".jade"
      compile: (str, filename, callback) ->
        jade = cache.jade or (cache.jade = require("jade"))
        options = {}
        options.pretty = true
        options.filename = filename
        fnjade = jade.compile(str,options)
        fnjade = jade.compile str,
          filename: filename
          pretty: true
          compileDebug: false
        callback null, fnjade()

          
      compile1: (str, fn) ->
        jade = cache.jade or (cache.jade = require("jade"))
        try
          options = {}
          options.pretty = true
          fnjade = jade.compile(str,options)
          fn null, fnjade()
        catch err
          fn err
      compile2: (filepath, callback) ->
        libs.jade or= require 'jade'
        fs.readFile filepath, 'utf8', (err, str) ->
          return callback err if err
          try
            options = {}
            options.pretty = true
            fnjade = libs.jade.compile(str,options)
            callback null, fnjade()
          catch err
            callback err

    stylus:
      match: /\.css$/
      ext: '.styl'
      compile: (str, filename, callback) ->
        stylus = cache.stylus || (cache.stylus = require('stylus'))
        nib = cache.nib or= (cache.nib = require('nib'))
        #landscape = cache.landscape or= (cache.landscape = require('landscape'))
        #optionsMap: {}
        #options = @optionsMap[sourcePath] ?=
        #  filename: filename
        options = 
          filename: filename
        stylus(str, options)
          .use(nib())
          #.use(landscape())
          #.set('compress', @compress)
          .set('include css', true)
          .render callback
          
      compile3: (str, filename, callback) ->
        stylus = cache.stylus || (cache.stylus = require('stylus'))
        nib = cache.nib or= (cache.nib = require('nib'))
        landscape = cache.landscape or= (cache.landscape = require('landscape'))
        #optionsMap: {}
        #options = @optionsMap[sourcePath] ?=
        #  filename: filename
        options = 
          filename: filename
        stylus(str, options)
          .use(nib())
          .use(landscape())
          #.set('compress', @compress)
          .set('include css', true)
          .render callback
        
      compile1: (str, fn) ->
        stylus = cache.stylus || (cache.stylus = require('stylus'))
        try
          stylus.render str, fn
        catch err
          fn err
      compile2: (filepath, callback) ->
        libs.stylus or= require 'stylus'
        libs.nib or= try require 'nib' catch e then (-> ->)
        fs.readFile filepath, 'utf8', (err, str) ->
          libs.stylus(str).set('filename', filepath)
                          .use(libs.nib())
                          .render(callback)
                          
    #
    less: 
      match: /\.css$/
      ext: ".less"
      compile: (str, filename, fn) ->
        less = cache.less or (cache.less = require("less"))
        try
          #less.render str, fn
          #baseName = path.basename filename
          dirName = path.dirname filename
          #console.log filename
          #console.log baseName
          #console.log dirName
          #console.log  @options
          #lib = path.join process.cwd(), "app", 'middle', 'lib', 'bootstrap', 'less'
          lib = path.join process.cwd(), 'lib', 'styles', 'less'
          #console.log lib
          parser = new (less.Parser)(
            #paths: [ ".", "./lib" ] # Specify search paths for @import directives
            # /Users/ademir/habisp/code/sp/calling/app/middle/lib/bootstrap/less
            paths: [ ".", "./lib", dirName, lib ] # Specify search paths for @import directives
            #optimization: 1
            #strictImports: true
            filename: filename # Specify a filename, for better error messages
          )
          #console.log filename
          parser.parse str, (e, tree) ->
            #tree.toCSS compress: true # Minify CSS output
            #console.log tree
            #console.log tree.toCSS()
            fn e, tree.toCSS()
        catch err
          fn err
      compile1: (str, filename, fn) ->
        less = cache.less or (cache.less = require("less"))
        try
          less.render str, fn
        catch err
          fn err
          
    cson:
      match: /\.json$/
      ext: '.cson'
      compile: (str, filepath, callback) ->
        cson = cache.cson || (cache.cson = require('cson'))
        cson.parse str, (err,obj) ->
           return callback err if err
           cson.stringify obj, (err,str) ->
             return callback err if err
             callback null, str
      compile1: (str, filepath, callback) ->
        cson = cache.cson || (cache.cson = require('cson'))
        cson.parseFile filepath, (err,obj) ->
          return callback err if err
          cson.stringify obj, (err,str) ->
            return callback err if err
            callback null, str
        ###
        fs.readFile filepath, 'utf8', (err, str) ->
          return callback err if err
          try
            callback null, libs.CoffeeScript.compile str
          catch e
            callback e
        ###
    
    
    sass: 
      match: /\.css$/
      ext: ".sass"
      compile: (str, fn) ->
        sass = cache.sass or (cache.sass = require("sass"))
        try
          fn null, sass.render(str)
        catch err
          fn err


  ###
  middleware: () ->
    (req, res, next) =>
      originalFilename = url.parse(req.url).pathname
      filename = "#{@options.path}#{originalFilename}"
      extname = path.extname filename
      @cache.changed filename, false
      params = {
        polymorph: this
        filename
        extname
      }
      asyncPool @handlers, params, () =>
        if @cache.exist filename
          res.setHeader 'Content-Type', mime.lookup extname
          res.end @cache.get filename
        else
          next()
  ###
          
  #
  middleware: () ->
    (req, res, next) =>
      return next() unless req.method is 'GET'
      
      debug 'middleware begins'
      #join = path.join
      #basename = path.basename
      #normalize = path.normalize
      
      pathname = parse(req.url).pathname
      #originalFilename = url.parse(req.url).pathname
      #filename = "#{@options.src}#{originalFilename}"
      #extname = path.extname filename
      targetPath = path.join @options.src, parse(req.url).pathname
      #console.log targetPath
      
      return next() if targetPath.slice(-1) is '/'  # ignore directory requests
      
      #basename = path.basename pathname
      #src = basename.replace(match, ".#{ext}")
      #srcPath = __dirname + '/' + src
      
      pathName = url.parse(req.url).pathname
      baseName = path.basename pathName
      extname = path.extname baseName
          
      dirName = path.dirname pathName
      thatsMe = /\/habisp/
      thatsMe = //
      return next() unless thatsMe.test dirName
      
      debug 'path matched'
      
      compiler = undefined
      for c of compilers
        if compilers[c].match.test(baseName)
          compiler = c
          break
          
      debug "quick compiler %s", compiler
      ###    
      comps = []
      for c of compilers
        if compilers[c].match.test(baseName)
          comps.push c
          #break
      ###
      #console.log comps
      #console.log compiler
      #console.log pathName
      #console.log baseName
      
      #console.time('100-elements')
      #start = +new Date()
      cps = []
      for own key, value of compilers
        if value.match.test(baseName)
          #cps.push ["#{key}"] : value
          ob = {}
          ob[key] = value
          cps.push value
          #cps.push {}[key] = value
         
      #console.log cps
      #return next()
         
      #console.log cps
      #console.log cps.length
      return next() if cps.length == 0
      
      debug "compiler found: %d", cps.length
      
      testPath = pathName.replace(thatsMe, @options.src)
      #console.log pathName
      #console.log testPath
      
      debug "test path %s", testPath
      
      fls = cps.map (cp) -> 
        testPath.replace(cp.match, cp.ext)
        #testPath.replace(compilers[cp].match, compilers[cp].ext)
        #for own key, value of cp
        #  #console.log cp
        #  testPath.replace(value.match, value.ext)
      
      #console.log fls
      #return next()
      
      async.detect fls, path.exists, (result) ->
        return next() if not result
        #console.log result
        extFound = path.extname result
        #console.log extFound
        i = fls.indexOf(result)
        compiler = cps[i]
        #for own key, value of compilers when value.ext == extFound
        #  console.log value.ext
        #  #console.log compl for own compl, value of compilers when result ext: ".less"
        
        srcPath = result
        #end = +new Date()
        #console.log ("%s,%n",srcPath,end - start)
        #count = end - start
        #console.log('%s: count: %d', srcPath, count)
        #console.timeEnd('100-elements')
        debug "source path %s ", srcPath
        fs.stat srcPath, (err, stats) =>
          # return next() if err

          # ignore ENOENT
          if err
            if "ENOENT" == err.code then return next() else return next(err)

          head = 'HEAD' == req.method
          get = 'GET' == req.method

          # header fields
          res.setHeader "Date", new Date().toUTCString()  unless res.getHeader("Date")
          res.setHeader "Cache-Control", "public, max-age=" + 0  unless res.getHeader("Cache-Control")
          res.setHeader "Last-Modified", stats.mtime.toUTCString()  unless res.getHeader("Last-Modified")
          res.setHeader "ETag", utils.etag(stats)  unless res.getHeader("ETag")

          #// conditional GET support
          if utils.conditionalGET req
            unless utils.modified req, res
              req.emit('static')
              debug "conditional get"
              return utils.notModified res

          debug "req method %s", req.method
          return res.end() if head

          if timeEq stats.mtime, cache[targetPath]?.mtime
            alreadyCached = true
            debug "serve from cache %s", targetPath
            res.setHeader 'Content-Type', mime.lookup extname
            return res.end cache[targetPath].body

          fs.readFile srcPath, 'utf8', (err, str) =>
            return next err if err
            try
              #compilers[compiler].compile str, srcPath, (err, compiled)->
              #console.timeEnd('compile')
              #start = +new Date()
              debug "compiling..."
              compiler.compile str, srcPath, (err, compiled)->
                cache[targetPath] = {mtime: stats.mtime, body: compiled}
                res.setHeader 'Content-Type', mime.lookup extname
                #console.timeEnd('compile')
                #end = +new Date()
                #count = end - start
                #console.log('%s: count: %d', srcPath, count)
                debug "compiled"
                res.end compiled
            catch err
              return next err
              
              
      ###########################
      #return next()
      return
      #async.filter fls, path.exists, (results) ->
      #  console.log 'end filter'
      #  console.log results[0]
        
        
      console.log 'out filter'
      #console.log results

      
      if not compiler
        return next()
      
      match1 = pathName.replace(thatsMe, @options.src)
      ###
      for cp in comps
        compiler = cp
      ###
      match2 = match1.replace(compilers[compiler].match, compilers[compiler].ext)

      srcPath = match2
      ###
        console.log srcPath
        found = false
        fs.stat srcPath, (err, stats) =>
          # ignore ENOENT
          if err
            if "ENOENT" != err.code then found = true
      ###
      
      fs.stat srcPath, (err, stats) =>
        # return next() if err
        
        # ignore ENOENT
        if err
          if "ENOENT" == err.code then return next() else return next(err)

        head = 'HEAD' == req.method
        get = 'GET' == req.method
        
        # header fields
        res.setHeader "Date", new Date().toUTCString()  unless res.getHeader("Date")
        res.setHeader "Cache-Control", "public, max-age=" + 0  unless res.getHeader("Cache-Control")
        res.setHeader "Last-Modified", stats.mtime.toUTCString()  unless res.getHeader("Last-Modified")
        res.setHeader "ETag", utils.etag(stats)  unless res.getHeader("ETag")
        
        #// conditional GET support
        if utils.conditionalGET req
          unless utils.modified req, res
            req.emit('static')
            return utils.notModified res
        
        return res.end() if head
        
        if timeEq stats.mtime, cache[targetPath]?.mtime
          alreadyCached = true
          res.setHeader 'Content-Type', mime.lookup extname
          return res.end cache[targetPath].body

        fs.readFile srcPath, 'utf8', (err, str) =>
          return next err if err
          try
            compilers[compiler].compile str, srcPath, (err, compiled)->
              cache[targetPath] = {mtime: stats.mtime, body: compiled}
              res.setHeader 'Content-Type', mime.lookup extname
              res.end compiled
          catch err
            return next err
###
asyncPool = (pool, params, index, cb) ->
  [cb, index] = [index, 0] if typeof index is 'function'
  if index is pool.length
    cb params
  else
    next = () ->
      asyncPool pool, params, index+1, cb
    pool[index].call null, params, next
###
