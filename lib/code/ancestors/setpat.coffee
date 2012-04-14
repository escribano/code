Function::define = (prop, desc) ->
    Object.defineProperty this.prototype, prop, desc

class GetterSetterTest
    constructor: (@_obj = {}) ->

    # 'obj' is defined via the prototype, the definition proxied through
    # to 'Object.defineProperty' via a function called 'define' providing
    # some nice syntactic sugar.  Remember, the value of '@' is
    # GetterSetterTest itself when used in the body of it's class definition.
    @define 'obj'
        get: ->
            return @_obj
        set: (value) ->
            @_obj = value

    _obj: null