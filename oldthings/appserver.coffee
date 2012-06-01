require("./lib/cluster/cluster-server") ->
  #express = require("express")
  #app = express.createServer()
  app = require('./app')
  #app.get "/", (req, res) ->
  #  res.send "Hello, World"
  
  port = process.env.PORT || 3000
  
  #app.listen port
  
  config =  app.set('config')
  
  console.log "%s, version: %s, port %d, %s mode"
    , config.app.name
    , config.app.version
    , port
    , app.settings.env
  
  console.log "mongo_uri: %s"  
    , config.mongo_uri
  
  app
