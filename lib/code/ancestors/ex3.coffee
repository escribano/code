class Model
  # This is the CoffeeScript syntax to declare a class method
  @field: (name, options) ->
    @fields ?= {}
    @fields[name] = options || {}
  constructor: (attributes) =>
    @attributes = {}
    # Copy in attributes passed in or defaults from the fields as
    # appropriate
    for name, options of @constructor.fields
      # Defaults can be specified as values or as functions
      @attributes[name]  = if attributes?[name] 
        attributes?[name] 
      else
        if isFunction(options.default)
          options.default() 
         else
           options.default
  # Getters and setters
  get: (name) =>
    @attributes[name]
  set: (name, value) =>
    field = @constructor.fields[name]
    throw Error('Trying to set an non-existent property!') if not field
    # Ignore a re-setting of the same value
    return if value == @get(name)
    @attributes[name] = value