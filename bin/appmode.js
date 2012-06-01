
appMode = function () {
  // unless module.parent
  if (!module.parent) {
    //debug('acquiring app')
    var app;
    app = getApp()
    app.listen(app.set('port'));
    console.log('Calling started on port 3000');
    //debug('server listening')
    //log(app)
  }
}