###
 * Load controllers
###
debug         = require('debug')('code:route')
SystemController = require '../controllers/system'
systemController = new SystemController

userModel = require '../models/user'
#restrict = user.restrict

module.exports = ->
  
  @get "/"            , systemController.root
  @get "/restricted"  , userModel.restrict, systemController.restricted
  @get "/logout"      , systemController.logout
  @get "/login"       , systemController.login
  @post "/login"      , systemController.loginPost

  @get "/markdown/marked", (req, res) ->
    res.render "markdown/marked/index.md",
      title: "Markdown Example"

  @get "/markdown/gfm", (req, res) ->
    res.render "markdown/gfm/index.gfm",
      title: "Markdown Example"

  @get "/markdown/fail", (req, res) ->
    res.render "markdown/missing.md",
      title: "Markdown Example"

  debug '%s done', __filename
  ###
  @get "/", (req, res) ->
    res.format
      html: ->
        res.send "<ul>" + users.map((user) ->
          "<li>" + user.name + "</li>"
        ).join("") + "</ul>"

      text: ->
        res.send users.map((user) ->
          " - " + user.name + "\n"
        ).join("")

      json: ->
        res.json users
  ###
  #@get '/', (req,res,next) ->
  #  res.send 'system root'
  #  res.local "foo", bar
  #  res.local "bar", baz
  #  res.locals
  #    foo: bar
  #    bar
  #    baz

    

