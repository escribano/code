userModel = require '../models/user'
#restrict = user.restrict
#authenticate = user.authenticate

module.exports = class SystemController # extends Controller
  
  root: (req, res) ->
    res.redirect "login"
    
  restricted: (req, res) ->
    res.send "restricted area"
    
  logout: (req, res) ->
    # destroy the user's session to log them out
    # will be re-created next request
    req.session.destroy ->
      res.redirect "/"
      
  login: (req, res) ->
    req.session.success = "Authenticated as " + req.session.user.name + " click to <a href=\"/logout\">logout</a>. " + " You may now access <a href=\"/restricted\">/restricted</a>."  if req.session.user
    res.render "system/login"
    
  loginPost: (req, res) ->
    userModel.authenticate req.body.username, req.body.password, (err, user) ->
      if user
        # Regenerate session when signing in
        # to prevent fixation
        req.session.regenerate ->
          # Store the user's primary key 
          # in the session store to be retrieved,
          # or in this case the entire user object
          req.session.user = user
          console.log req.get('Referrer')
          res.redirect "back"
      else
        req.session.error = "Authentication failed, please check your " + " username and password." + " (use \"admin\" and \"foobar\")"
        console.log req.get('Referrer')
        res.redirect "/login?redir=" + req.get('Referrer')

