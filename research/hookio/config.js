/*
 * config.js: Module responsible for config actions.
 *
 * (C) 2011 Nodejitsu Inc.
 * MIT LICENCE
 *
 */

var nconf  = require('nconf'),
    hookio = require('../hookio'),
    path   = require('path'),
    argv   = hookio.cli.argv;

var config = exports.config =  function (options) {
  var self = this;

  //
  // Each hook get's their own config.json file managed
  // by an instance of the `nconf.Provider`.
  //
  // Remark: This configuration path needs to load from a
  // default configuration file and then write to a custom
  // configuration file based on the hook `type/name` combo.
  //

  this.config = new nconf.Provider();
  function useFileStore () {
    if (argv.config) {
      self.configFilePath = path.resolve(argv.config);
    }
    self.config.use('file', { file: self.configFilePath || './config.json' });
  }
  
  var configRedisFailed = false;
  if (options.redis) {
    //
    // Remark: try / catch is a hack for doing optional npm deps
    //
    //
    try {
      require('nconf-redis');
      this.config.use('redis', options.redis);
      
      // Load config asynchronously
      this.config.load( function (err, data) {
        if (err) {
          useFileStore();
          configRedisFailed = true;
          return
        }
        Object.keys(data).forEach(function (o) {
          checkProperty(o, self[o]);
          self[o] = config[o];
        });
      });
        
    } catch(ex) {
      console.error("(node) warning: Missing nconf-redis module");
      configRedisFailed = true
      useFileStore();
    }
  } else {
    useFileStore();
  }

  if (!options.redis || configRedisFailed) {
    
    this.config.load();

    //
    // Load the nconf store into memory
    //
    var config = this.config.store.store;
  
    //
    // Iterate over nconf store and copy key values,
    // to Hook
    //
    Object.keys(config).forEach(function (o) {
      checkProperty(o, self[o]);
      self[o] = config[o];
    });
  }

  function checkProperty (key, value) {
    if(typeof value === "function") {
      throw new Error('You are attempting to override prototype method: "' + key + '". This is probably a bad idea.');
    }
  }

  //
  // Iterate over argv and copy key values,
  // to Hook ( overwriting duplicate keys from config )
  //
  Object.keys(argv).forEach(function (o) {
    var reserved = ["hook-port", "hook-host"];
    if (reserved.indexOf(o) === -1) {
      checkProperty(o, self[o]);
      self[o] = argv[o];
    }
  });

  //
  // Iterate over options and copy key values,
  // to Hook ( overwriting duplicate keys from argv and config )
  //
  Object.keys(options).forEach(function (o) {
    checkProperty(o, self[o]);
    self[o] = options[o];
  });

  //
  // Remark: This is a hack for passing arrays of objects as strings,
  // through argv...fix this in optimist
  //
  if (typeof this.transports === 'string') {
    try {
      this.transports = JSON.parse(this.transports);
    } catch (err) {
     console.log('warn: bad transport parse', err.message);
    }
  }

}
