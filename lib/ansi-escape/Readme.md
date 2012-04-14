# ansi-escape

simplest possible colored console output

## Installation

```
npm install git://github.com/snd/ansi-escape.git
```

## Usage

```coffeescript
{fg, bg} = require 'ansi-escape'

console.log "#{fg.green 'this is green on white'} and #{fg.magenta 'this is magenta on white'}"
console.log "#{bg.green 'this is black on green'} and #{bg.magenta 'this is black on magenta'}"
console.log "#{bg.black fg.gray 'this is gray on black'} and #{bg.black fg.green 'this is green on black'}"
```

**Available colors:** black, red, green, yellow, blue, magenta, cyan and gray

## License

ansi-escape is released under the MIT License (see LICENSE for details).