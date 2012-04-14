defineProperty = (object, name, method) ->
  unless object[name]
    Object.defineProperty object, name,
      configurable: true
      enumerable: false
      writable: true
      value: method

defineProperties = (object, map) ->
  Object.keys(map).forEach (name) ->
    defineProperty object, name, map[name]

defineProperties Object,
  deepFreeze: (object) ->
    Object.keys(Object.freeze(object))
      .map (key) ->
        object[key]
      .filter (value) ->
        typeof value is 'object' and value? and not Object.isFrozen(value)
      .forEach(Object.deepFreeze)
    object

defineProperties Array.prototype,
  unique: ->
    @reduce (acc, elem) ->
      acc.concat(if acc.indexOf(elem) < 0 then [elem] else [])
    , []

  flatten: ->
    @reduce (acc, elem) ->
      acc.concat(if Array.isArray(elem) then elem else [elem])
    , []

  flatMap: (callback) ->
    @reduce (acc, elem) ->
      result = if Array.isArray(elem)
        elem.map(callback)
      else
        [callback(elem)]
      acc.concat(result)
    , []