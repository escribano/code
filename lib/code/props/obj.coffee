###
# defines a property on an object/class
# modified from https://gist.github.com/746380
###
Object::public = (name, options = {}) ->
  options['default'] ?= null
  variable = options['default']
  getter = if typeof options['get'] is 'function' then options['get'] else -> variable
  setter = if typeof options['set'] is 'function' then options['set'] else (value) ->  variable = value

  config = {}
  config['get'] = getter if options['get']
  config['set'] = setter if options['set']
  config['configurable'] = no
  config['enumerable'] = yes

  Object.defineProperty @prototype, name, config