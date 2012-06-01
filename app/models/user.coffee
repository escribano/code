crypto        = require('crypto')

#users = []
#users.push name: "Tobi"
#users.push name: "Loki"
#users.push name: "Jane"

# Used to generate a hash of the plain-text password + salt
hash = (msg, key) ->
  crypto.createHmac("sha256", key)
    .update(msg).digest "hex"

# Generate a salt for the user to prevent rainbow table attacks
# for better security take a look at the bcrypt c++ addon:
# https://github.com/ncb000gt/node.bcrypt.js
exports.users = users = admin:
  name: "admin"
  salt: "randomly-generated-salt"
  pass: hash("foobar", "randomly-generated-salt")
      
# Authenticate using our plain-object database 
exports.authenticate = authenticate = (name, pass, fn) ->
  console.log "authenticating %s:%s", name, pass
  user = users[name]
  # query the db for the given username
  return fn(new Error("cannot find user"))  unless user
  # apply the same algorithm to the POSTed password, applying
  # the hash against the pass / salt, if there is a match we
  # found the user
  return fn(null, user)  if user.pass is hash(pass, user.salt)
  # Otherwise password is invalid
  fn new Error("invalid password")
  
exports.restrict = (req, res, next) ->
  if req.session.user
    next()
  else
    req.session.error = "Access denied!"
    res.redirect "/login"

