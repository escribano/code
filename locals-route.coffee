


pathRegexp = (path, keys, sensitive, strict) ->
  return path  if path instanceof RegExp
  path = "(" + path.join("|") + ")"  if path instanceof Array
  path = path.concat((if strict then "" else "/?")).replace(/\/\(/g, "(?:/").replace(/(\/)?(\.)?:(\w+)(?:(\(.*?\)))?(\?)?/g, (_, slash, format, key, capture, optional) ->
    keys.push
      name: key
      optional: !!optional

    slash = slash or ""
    "" + (if optional then "" else slash) + "(?:" + (if optional then slash else "") + (format or "") + (capture or (format and "([^/.]+?)" or "([^/]+?)")) + ")" + (optional or "")
  ).replace(/([\/.])/g, "\\$1").replace(/\*/g, "(.*)")
  new xRegExp("^" + path + "$", (if sensitive then "" else "i"))


#regexp = pathRegexp(path, keys = [], options.sensitive, options.strict)

module.exports = ->
  app = @
    
  @locals.url_for = (routeName, param, query) ->
    route = app.metaRoutes[routeName]
    return '#' if not route
    path = route.path.replace(/:(\w+)(?:(\(.*?\)))?(\?)?/, if param then param else "")
    return path
    str = route.path
    console.log str
    #console.log str.replace /?:/m, 'foo' 
    #m = pathRegexp(str, keys = ['str'])
    #console.log m.exec()
    #path = str.replace(/\/\(/g, "(?:/" + str)
    #path = str.replace(/(\/)?(\.)?:(\w+)(?:(\(.*?\)))?(\?)?/, str)
    path = route.path.replace(/:(\w+)(?:(\(.*?\)))?(\?)?/, if param then param else "")
    
    #path = str.replace(/(\/)?(\.)?:(\w+)(?:(\(.*?\)))?(\?)?/g)
    #path = path.replace(/([\/.])/g, "\\$1").replace(/\*/g, "(.*)")
    console.log path
    #r = new RegExp("^" + path + "$", (if sensitive then "" else "i"))
    #console.log r
    #console.log r.exec()
    return route.path if route
    return '#'

###
return '#' if not route
routePath = route.path
string.replace(regexp/substr,newstring)
"$TESTONE $TESTONE".replace( new RegExp("\\$TESTONE","gm"),"foo")
s.replace(/([.*+?^$|(){}\[\]])/mg, "\\$1")