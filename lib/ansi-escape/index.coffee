_ = require 'underscore'

escapeCode = (code) -> '\u001b[' + code + 'm'
reset = escapeCode 0
surround = (code, string) -> (escapeCode code) + string + reset

colors = 'black red green yellow blue magenta cyan gray'.split ' '

foregroundCodeStart = 30
backgroundCodeStart = 40

module.exports.fg = {}
module.exports.bg = {}

n = 0

_.each colors, (color) ->
    code = n++
    module.exports.fg[color] = (string) -> surround (foregroundCodeStart + code), string
    module.exports.bg[color] = (string) -> surround (backgroundCodeStart + code), string