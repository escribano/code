#!/usr/bin/env coffee
applib = require './applib'
app = applib.getApp()
app.listen app.set('port')
applib.log(app)