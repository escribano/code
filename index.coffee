#module.exports = require('./lib/call')

module.exports = (if process.env.COV then require("./lib-cov/code") else require("./lib/code"))
