exports.autoreq = createApiTree = (directory, options={}) ->
  options.loadItem    ||= require
  options.nameToKey   ||= (name) -> name .split('.')[0] .replace(/_*\W+_*/g, '_')
  options.readdirSync ||= (path) -> fs.readdirSync(path)
  options.isDirectory ||= (path) -> fs.lstatSync(path).isDirectory()
  options.filter      ||= (name, names) -> name.match(/\.js$/) or (name.match(/\.coffee$/) and not (name.replace(/\.coffee$/, '.js') in names))

  tree = {}

  names = options.readdirSync(directory)
  for name in names
    continue if name.match(/^[._#]|[#~]$/)

    child = Path.join(directory, name)
    key   = options.nameToKey(name)

    item = if options.isDirectory(child)
      createApiTree(child, options)
    else if options.filter(name, names)
      options.loadItem(child)

