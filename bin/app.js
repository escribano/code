require('coffee-script')

exports.getApp = function () {
  app = require('../app')
  app.set('port', process.env.PORT || 3000)
  app.set('hostname', 'localhost')
  return (app)
}

var log = function(app) {
  return console.log("%s, version: %s, host %s:%d, %s mode", app.set('app name'), app.set('app version'), app.set('hostname'), app.set('port'), app.settings.env);
};

if (!module.parent) {
  //debug('acquiring app')
  var app = this.getApp()
  //debug('app acquired')
  app.listen(app.set('port'));
  //debug('server listening')
  log(app)
}
