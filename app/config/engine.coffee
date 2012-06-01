path = require 'path'
fs = require("fs")
  
module.exports = ->

  # register template
  @set 'view engine', 'jade'
  @set 'views', @set 'views path'

  @set('view options', { layout: false }) unless @settings['express3']
  #if app.set 'use layout'
  #  app.set('view options', { layout: 'layout/main' })
  #else
  #  app.set('view options', { layout: false })
  #console.log @settings['view engine']
  
  md = require("github-flavored-markdown").parse
  # register .md as an engine in express view system
  @engine "gfm", (path, options, fn) ->
    fs.readFile path, "utf8", (err, str) ->
      return fn(err)  if err
      try
        html = md(str)
        html = html.replace(/\{([^}]+)\}/g, (_, name) ->
          options[name] or ""
        )
        fn null, html
      catch err
        fn err
        
  marked = require("marked")
  # Set default options
  marked.setOptions
    gfm: true # Enable github flavored markdown (enabled by default).
    pedantic: false # Conform to obscure parts of markdown.pl as much as possible. Don't fix any of the original markdown bugs or poor behavior.
    sanitize: true # Sanitize the output. Ignore any HTML that has been input.
    #highlight: (code, lang) -> # A callback to highlight code blocks.
    #  return javascriptHighlighter(code)  if lang is "js"
    #  code

  # register .md as an engine in express view system
  @engine "md", (path, options, fn) ->
    fs.readFile path, "utf8", (err, str) ->
      return fn(err)  if err
      try
        html = marked(str)
        html = html.replace(/\{([^}]+)\}/g, (_, name) ->
          options[name] or ""
        )
        fn null, html
      catch err
        fn err
  ###      
  #markdown = require("some-markdown-library")
  app.engine "md", (path, options, fn) ->
    fs.readFile path, "utf8", (err, str) ->
      return fn(err)  if err
      str = markdown.parse(str).toString()
      fn null, str
  ###