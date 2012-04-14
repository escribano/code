# global constants
ROOT = exports ? this
ROOT.READ = 1
ROOT.WRITE = 2


# defines a property on an object/class
Object::has = (name, options = {}) ->
  options['access'] ?= READ | WRITE
  options['default'] ?= null
  options['variable'] ?= '_' + name
  options['get'] ?= 'get_' + name
  options['set'] ?= 'set_' + name
  
  readable = options['access'] & READ
  writeable = options['access'] & WRITE
    
  getter = this[options['get']] or -> this[options['variable']] + ' (accessed through getter)'
  setter = this[options['set']] or (value) ->  this[options['variable']] = value + ' (set through setter)'
  
  config = {}
  config['writeable'] = writeable
  config['get'] = getter if readable
  config['set'] = setter if writeable
  config['configurable'] = no
  config['enumerable'] = yes

  using_default_getter_or_setter = this[options['get']]? or this[options['set']]?  
  @prototype[options['variable']] = options['default'] if using_default_getter_or_setter
  Object.defineProperty @prototype, name, config


# TODO: Implement these.
Object::has_one = (name, options) -> null
Object::has_many = (name, options) -> null
Object::belongs_to = (name, options) -> null
Object::has_and_belongs_to_many = (name, options) -> null


# define the class
class Book
  @has 'uniqueID', access: READ, default: '010101010101'
  @has 'changed', access: WRITE
  @has 'title', default: 'New Book' # read and write by default
  @has 'author', default: 'Unknown'
  @has 'isbn'


# run some tests
book = new Book()
console.log 'Default book title: ' + book.title

book.title = 'CoffeeScript Cookbook'
console.log 'Title of book is: ' + book.title

book.uniqueID = "Test"
console.log book.uniqueID