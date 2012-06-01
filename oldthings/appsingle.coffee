
app = require('./app')
#console.log app
if require.main == module
  
  port = process.env.PORT || 3000
  hostname = 'localhost'
  #app.listen port, hostname, callback
  app.listen port
  
  #config =  app.set('config')
  
  console.log "%s, version: %s, host %s:%d, %s mode"
    , app.set('app name')
    , app.set('app version')
    , hostname
    , port
    #, 3
    , app.settings.env
    
  #console.log "mongo_uri: %s"  
  #  , config.mongo_uri




