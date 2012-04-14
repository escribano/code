obj = {}
Object.defineProperty obj, "value",
  value: true
  writable: false
  enumerable: true
  configurable: true

(->
  name = "John"
  Object.defineProperty obj, "name",
    get: ->
      name

    set: (value) ->
      name = value
)()
