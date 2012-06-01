Hook = require('hook.io').Hook
util = require('util')
url = require 'url'

class exports.Test extends Hook
  constructor: (options) ->  
    options =
      name: "test-hook"
      debug: true
    Hook.call @, options

    @on "test::foo", (data) =>
      @_foo(data)
      
    @on "*::hello", (data) ->
      console.log "ive got commander data", data

  
    @.on "hook::ready", =>
      @emit('hello', 'hello poobear')
      for message in (@messages || [])
        @emit "test::foo",
          messagetext : message.messagetext # Obviously we could just pass message, just illustrating a point here


  _foo : (data) =>
    console.log "Sending message blueprint-coffeescript::bar with content #{data.messagetext}"
  
    if data.messagetext
      @emit "test::bar", 
        messagetext : data.messagetext
        head : false
    else
      @emit "test::error", 
        error : "Might consider handing me a message"