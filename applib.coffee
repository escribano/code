debug         = require('debug')('code:server')

exports.getApp = ->
  app = require('./app')
  app.set('port', process.env.PORT || 3000)
  app.set('hostname', 'localhost')
  app
  
exports.log = (app) ->
  console.log "%s, version: %s, host %s:%d, %s mode"
    , app.set('app name')
    , app.set('app version')
    , app.set('hostname')
    , app.set('port')
    , app.settings.env

# Print the `--help` usage message and exit. Deprecated switches are not
# shown.
exports.app = ->
  #unless module.parent
  if require.main == module
    debug('acquiring app')
    app = getApp()
    debug('app acquired')
    app.listen app.set('port')
    debug('server listening')
    log(app)