#mongoose = require 'mongoose'
Controller = require("meta").DSL.Controller

class MetaController extends Controller
      
  @action index: ->
    @layout = 'system/layouts/layout'
    @render "system/authz"
    
  @action welcome: ->
    return @send 'not authenticated' if not @req.person
    return @send @req.person
    
  @action admin: ->
    #if @req.person?
    @layout = 'system/layouts/layout'
    Person = mongoose.model('Person')
    Person.find {}, (err, @people) =>
      #people.forEach
      @render "system/authz/admin"
      
module.exports = MetaController