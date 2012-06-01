###
 * Express - Contrib - namespace
 * Copyright(c) 2010 TJ Holowaychuk <tj@vision-media.ca>
 * MIT Licensed
###

###
 * Module dependencies.
###

express = require("express")
join = require("path").join
#HTTPServer = express.HTTPServer
#HTTPSServer = express.HTTPSServer


###
 * Namespace using the given `path`, providing a callback `fn()`,
 * which will be invoked immediately, resetting the namespace to the previous.
 *
 * @param {String} path
 * @param {Function} fn
 * @return {Server} for chaining
 * @api public
###

exports.namespace = ->
  args = Array.apply(null, arguments)
  path = args.shift()
  fn = args.pop()
  self = this
  self.all path + "*", args  if args.length
  (@_ns = @_ns or []).push path
  fn.call this
  @_ns.pop()
  this


###
 * Return the current namespace.
 *
 * @return {String}
 * @api public
###

exports.__defineGetter__ "currentNamespace", ->
  #join.apply(this, @_ns).replace(/\\/g, "/").replace(/\/$/, "") or "/"
  join.apply(this, @_ns).replace("/\\/g", "/").replace("/\/$/", "") or "/"



###
 * Proxy HTTP methods to provide namespacing support.
###

#express.router.methods.concat("del").forEach (method) ->
express.Router.methods.concat("del").forEach (method) ->
  #orig = HTTPServer::[method]
  orig = express::[method]

  exports[method] = ->
    args = Array::slice.call(arguments)
    path = args.shift()
    fn = args.pop()
    self = this
    @namespace path, ->
      curr = @currentNamespace
      args.forEach (fn) ->
        fn.namespace = curr
        orig.call self, curr, fn

      fn.namespace = curr
      orig.call self, curr, fn

    this


# merge

for key of exports
  desc = Object.getOwnPropertyDescriptor(exports, key)
  #Object.defineProperty HTTPServer::, key, desc
  #Object.defineProperty HTTPSServer::, key, desc
  Object.defineProperty express.application::, key, desc
  Object.defineProperty express.application::, key, desc
