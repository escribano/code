
class Code

  constructor: (@options) ->
    options = options or {}
    @files = []
    @options = options
  
  test: ->
    console.log 'inside router'
    console.log typeof @options
    
  init: ->
    console.log 'inside router'
    console.log typeof @options
    
  @controllerName: -> 
    @_controllerName ?= @toString().match(/function ([^\(]+)/)[1].toLowerCase()
      
  @layout: 'application'
  
  @::__defineSetter__ 'err', (err) -> throw err if err

module.exports = Code