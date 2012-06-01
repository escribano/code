process.memoryUsage()#
Returns an object describing the memory usage of the Node process measured in bytes.

````
var util = require('util');

console.log(util.inspect(process.memoryUsage()));
````

This will generate:

{ rss: 4935680,
  heapTotal: 1826816,
  heapUsed: 650472 }
heapTotal and heapUsed refer to V8's memory usage.

process.uptime()#
Number of seconds Node has been running.

process.platform#
What platform you're running on. 'linux2', 'darwin', etc.

console.log('This platform is ' + process.platform);

process.arch#
What processor architecture you're running on: 'arm', 'ia32', or 'x64'.

console.log('This processor architecture is ' + process.arch);

process.pid#
The PID of the process.

console.log('This process is pid ' + process.pid);

process.installPrefix#
A compiled-in property that exposes NODE_PREFIX.

console.log('Prefix: ' + process.installPrefix);

process.versions#
A property exposing version strings of node and its dependencies.

console.log(process.versions);
Will output:

{ node: '0.4.12',
  v8: '3.1.8.26',
  ares: '1.7.4',
  ev: '4.4',
  openssl: '1.0.0e-fips' }
  
process.version#
A compiled-in property that exposes NODE_VERSION.

console.log('Version: ' + process.version);

process.cwd()#
Returns the current working directory of the process.

console.log('Current directory: ' + process.cwd());
process.env#
An object containing the user environment. See environ(7).

process.execPath#
This is the absolute pathname of the executable that started the process.

Example:

/usr/local/bin/node

