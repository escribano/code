class Point
    constructor: (x, y) ->
        _x = x ? 0.0
        _y = y ? 0.0
        _spatialRef = "EPSG:1234"

        Object.defineProperty @, "x", 
            get: -> _x
            set: (val) -> _x = val
            enumerable: true

        Object.defineProperty @, "y", 
            get: -> _y
            set: (val) -> _y = val
            enumerable: true

        Object.defineProperty @, "spatialRef",
            value: _spatialRef
            enumerable: true