###
 * utils
 * Copyright(c) 2010 Sencha Inc.
 * Copyright(c) 2011 TJ Holowaychuk
 * MIT Licensed
###

###
 * Module dependencies.
###

crypto = require("crypto")
Path = require("path")
fs = require("fs")


###
 * Flatten the given `arr`.
 *
 * @param {Array} arr
 * @return {Array}
 * @api private
###

exports.flatten = (arr, ret) ->
  ret = ret or []
  len = arr.length
  i = 0

  while i < len
    if Array.isArray(arr[i])
      exports.flatten arr[i], ret
    else
      ret.push arr[i]
    ++i
  ret


###
 * Return md5 hash of the given string and optional encoding,
 * defaulting to hex.
 *
 *     utils.md5('wahoo');
 *     // => "e493298061761236c96b02ea6aa8a2ad"
 *
 * @param {String} str
 * @param {String} encoding
 * @return {String}
 * @api public
###

exports.md5 = (str, encoding) ->
  crypto.createHash("md5").update(str).digest encoding or "hex"


###
 * Merge object b with object a.
 *
 *     var a = { foo: 'bar' }
 *       , b = { bar: 'baz' };
 *     
 *     utils.merge(a, b);
 *     // => { foo: 'bar', bar: 'baz' }
 *
 * @param {Object} a
 * @param {Object} b
 * @return {Object}
 * @api public
###

exports.merge = (a, b) ->
  if a and b
    for key of b
      a[key] = b[key]
  a


###
 * Escape the given string of `html`.
 *
 * @param {String} html
 * @return {String}
 * @api public
###

exports.escape = (html) ->
  String(html).replace(/&(?!\w+;)/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace /"/g, "&quot;"



###
 * Return a unique identifier with the given `len`.
 *
 *     utils.uid(10);
 *     // => "FDaS435D2z"
 *
 * @param {Number} len
 * @return {String}
 * @api public
###

exports.uid = (len) ->
  buf = []
  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
  charlen = chars.length
  i = 0

  while i < len
    buf.push chars[getRandomInt(0, charlen - 1)]
    ++i
  buf.join ""


###
 * Convert array-like object to an `Array`.
 *
 * node-bench measured "16.5 times faster than Array.prototype.slice.call()"
 *
 * @param {Object} obj
 * @return {Array}
 * @api public
###

toArray = exports.toArray = (obj) ->
  len = obj.length
  arr = new Array(len)
  i = 0

  while i < len
    arr[i] = obj[i]
    ++i
  arr


###
 * Retrun a random int, used by `utils.uid()`
 *
 * @param {Number} min
 * @param {Number} max
 * @return {Number}
 * @api private
###

getRandomInt = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

