{fg, bg} = require './index'

console.log "#{fg.green 'this is green on white'} and #{fg.magenta 'this is magenta on white'}"

console.log "#{bg.green 'this is black on green'} and #{bg.magenta 'this is black on magenta'}"

console.log "#{bg.black fg.gray 'this is gray on black'} and #{bg.black fg.green 'this is green on black'}"