<https://groups.google.com/forum/?fromgroups#!topic/nodejs/UAJtpcJXBsQ>

Hi,
  I am attempting to spawn a process with customFds defined. In the following code, whenever I use outStream or errStream as custom fds the process exits with code 2. When I remove the customFds the process returns with code 0, which is what I expect to see in the previous case. If I change customFds to [-1, process.stdout, -1] the same thing occurs.

I have tried all combinations of removing env, cwd, etc with the same result. The stream files are always empty when the process exits.

var sys = require('sys');
var fs = require('fs');
var child = require("child_process");

````
/* Create file streams for stdout/stderr. */
outStream = fs.createWriteStream("./stdout");
errStream = fs.createWriteStream("./stderr");
    
var proc = child.spawn("ls", [], {
  // The customFDs should be file descriptors, not streams.
  "customFds":[-1, outStream, errStream], 
  "env":{
    "NODE_PATH": process.env["NODE_PATH"],
    "SHELL":"/bin/bash", 
    "PATH": process.env["PATH"]
  },
  "cwd":"/tmp"
});
    
proc.addListener("exit", function(code, signal){
  if(signal){
    /* Killed by signal. */
    sys.debug("KILLED BY SIGNAL");
  }
  else if(code){
    /* Process exited with error. */
    sys.debug("CODE WAS " + code);
  }
  else{
    /* Successful termination. */
    sys.debug("SUCCESS");
  }
});
````


