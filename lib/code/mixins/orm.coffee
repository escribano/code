Module = require './module'

ORM = 
  find: (id) ->
  create: (attrs) ->
  extended: ->
    @include
      save: -> 

class User extends Module
  @extend ORM
  
  
exports = module.exports = User