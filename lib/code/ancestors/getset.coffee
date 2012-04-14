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
    
###
Only drawback is the use of the single-quotes when defining the property, but the result almost looks like it is a part of the language standard. The define function can also be modified to make use of __defineGetter__ and __defineSetter__ for backward compatibility (just look out for IE8's screwy implementation of Object.defineProperty). If you're planning on targeting only fairly modern browsers for your application and feel you need getter/setters, this may be a good replacement in the mean time.