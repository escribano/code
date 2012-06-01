Hook = require('hook.io').Hook
util = require('util')
colors = require('colors')    
url = require 'url'

require('pkginfo')(module,'version','hook')

class exports.HookMaster extends Hook
  constructor: (options) ->  
    Hook.call @, options

    @on "master::foo", (data) =>
      @_foo(data)
  
    @.on "hook::ready", =>
      for message in (@messages || [])
        @emit "master::foo",
          messagetext : message.messagetext # Obviously we could just pass message, just illustrating a point here


  _foo : (data) =>
    console.log "Sending message blueprint-coffeescript::bar with content #{data.messagetext}".cyan
  
    if data.messagetext
      @emit "master::bar", 
        messagetext : data.messagetext
        head : false
    else
      @emit "master::error", 
        error : "Might consider handing me a message"