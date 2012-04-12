###
 * Call
 * Copyright(c) 2012 AM Escribano <ame@habisp.org>
 * MIT Licensed
###

###
 * Module dependencies.
###

utils = require '.utils'
colors = require 'colors'
proto = require 'proto'

###
 * Create a Call.
 *
 * @return {Function}
 * @api public
###

createCall = ->
  app = new proto.Call
  utils.merge app, proto
  app.request = __proto__: colors
  app.response = __proto__: utils
  app.init()
  app

###
 * Expose `createCall()`.
###

exports = module.exports = createCall

###
 * version.
###

version = require('../package.json').version
exports.version = version
