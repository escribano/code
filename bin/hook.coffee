#!/usr/bin/env node

Hook = require("hook.io").Hook
hook = new Hook(
  name: "vanilla-hook"
  debug: true
)
self = hook
self.on "foo::bar", (data) ->
  console.log 'foo.bar: %s', data
  
  
# Register listener for hook::ready event	
hook.on "hook::ready", (data) ->
  console.log "hook started"
  hook.emit "test::foo", 
    messagetext : "bin"
    #head : false


# register listener for any events
hook.onAny (data) ->
  console.log 'any'
  console.log hook.event + " Data: " + JSON.stringify(data)


  
hook.start()
