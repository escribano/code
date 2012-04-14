# The beginnings of a declarative model syntax for CoffeeScript.
# SEE: http://almostobsolete.net/declarative-models-in-coffeescript.html
# Thomas Parslow
# Email: tom@almostobsolete.net
# Twitter: @almostobsolete

# The top part is the setup, see below that for the demo 

# To see this run right away try copy pasting it into the 'Try
# CoffeeScript' box at http://jashkenas.github.com/coffee-script/

# Please consider this code to be public domain. I'd appreciate it if you'd tell me if you use it but that's not at all required 

# In the browser we use alert but on Node.JS (which doesn't have alert) let's use console.log instead
alert ?= console.log

isFunction = (obj) ->
  Object.prototype.toString.call(obj) == '[object Function]'

class Model
  # This is the CoffeeScript syntax to declare a class method
  @field: (name, options) ->
    @fields ?= {}
    @fields[name] = options || {}
  @has_many: (klass, options) ->
    options ?= {}
    options.klass = klass
    options.as ?= klass.name.toLowerCase() + 's'
    @collections ?= {}
    @collections[options.as] = options

  constructor: (attributes) ->
    @attributes = {}
    # Copy in attributes passed in or defaults from the fields as appropriate
    for name, options of @constructor.fields
      # Defaults can be specified as values or as functions
      @attributes[name] = attributes?[name] || if (isFunction(options.default)) then options.default() else options.default
    # Set up collections
    for name,options of @constructor.collections
      @[name] = new Collection(@, options)
    @listeners = {}

  # Events
  bind: (event, listener) =>
    (@listeners[event] ?= []).push(listener)
  emit: (event, args...) =>
    listener(args...) for listener in @listeners[event] if @listeners[event]

  # Getters and setters
  get: (name) =>
    @attributes[name]
  set: (name, value) =>
    field = @constructor.fields[name]
    throw Error('Trying to set an non-existent property!') if not field
    # Ignore a re-setting of the same value
    return if value == @get(name)
    @attributes[name] = value
    # Emit change events!
    @emit('change', name, value)
    @emit("change:#{name}", value)

# A collection class for has_many relations
class Collection
  # Using CoffeeScript destructuring bind to extract the bits we need from options
  constructor: (@parent, {as: @field_name, klass: @klass}) ->
    @members = []
  create: (attributes) =>
    @add(new @klass(attributes))
  add: (thing) =>
    @members.push(thing)
    @parent.emit("add:#{@field_name}", thing)
    thing
  remove: (thing) =>
    for _thing, i in @members when _thing == thing
      delete @members[i]
      @parent.emit("remove:#{@field_name}", thing)
      break
  all: =>
    _.clone(@members)
  length: =>
    @members.length
  at: (index) =>
    @members[index]

# Demo

class Post extends Model
  @field 'title', default: 'New post!'
  @field 'body'
  # the default is supplied as a closure which is evaluated at object creation time
  @field 'created_at', default: -> new Date()

class User extends Model
  @field 'username'
  @field 'twitter'
  @has_many Post, as: 'posts'


# Create a new user
user = new User(username: 'tom', twitter: 'almostobsolete')
# Bind to the change event for the title property
user.bind 'change:username', (value) =>
  alert "Username updated to #{value}"
# Print out details of posts when they are created by the user
user.bind 'add:posts', (post) =>
  alert "Post titled #{post.get('title')} was written at #{post.get('created_at')}"
# Print out details of posts when they are created by the user
user.bind 'remove:posts', (post) =>
  alert "Post titled #{post.get('title')} was removed"

# Change the user's username (which will trigger the event bound above)
user.set('username', 'thomas')

# Create a blog post associated with the new user (which will trigger the other event)
post = user.posts.create
  title: 'Declarative Models'
  body: 'One of the useful additions....'

alert "There are now #{user.posts.length()} posts by #{user.get('username')} and the first is called #{user.posts.at(0).get('title')}"

user.posts.remove(post)