require('coffee-script')
var cluster_server = require("../lib/cluster/cluster-server")

var app = require("./app")

exports.run = function () {
 cluster_server(app.getApp)
}

if (!module.parent) {
  this.run()
}
