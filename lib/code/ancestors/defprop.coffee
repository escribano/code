# Basically, you want some kind of wrapper around Object.defineProperty or Object.defineProperties. Make sure you specify configurable: true if you want the ability to define the getter and setter separately.
exports.EXObject = class EXObject

    @get: (propertyName, func) ->
        Object.defineProperty @::, propertyName,
            configurable: true
            enumerable: true
            get: func

    @set: (propertyName, func) ->
        Object.defineProperty @::, propertyName,
            configurable: true
            enumerable: true
            set: func
            
            
# For fun, here's an example of a partial Vector class that can be accessed as an array using this sugar:

class Vector3D extends EXObject
    constructor: (@x, @y, @z) ->

    @get 'x', -> @[0]
    @get 'y', -> @[1]
    @get 'z', -> @[2]

    @set 'x', (x) -> @[0] = x
    @set 'y', (y) -> @[1] = y
    @set 'z', (z) -> @[2] = z