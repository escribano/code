#_ = require 'underscore'

escapeCode = (code) -> '\u001b[' + code + 'm'
reset = escapeCode 0
surround = (code, string) -> (escapeCode code) + string + reset

#colors = 'black red green yellow blue magenta cyan gray'.split ' '
colors = 'black red green yellow blue magenta cyan white'.split ' '

foregroundCodeStart = 30
backgroundCodeStart = 40

module.exports.fg = {}
module.exports.bg = {}

colors.forEach (color, index) ->
  module.exports.fg[color] = (string) -> surround (foregroundCodeStart + index), string
  module.exports.bg[color] = (string) -> surround (backgroundCodeStart + index), string

module.exports.fg.gray = (string) -> surround (90), string
#module.exports.bg.gray = (string) -> surround (backgroundCodeStart + 90), string
module.exports.bright = (string) -> surround (1), string
###
n = 0

_.each colors, (color) ->
  code = n++
  console.log "%s, %d", color, code
  module.exports.fg[color] = (string) -> surround (foregroundCodeStart + code), string
  module.exports.bg[color] = (string) -> surround (backgroundCodeStart + code), string
###