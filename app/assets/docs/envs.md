<https://groups.google.com/forum/?fromgroups#!topic/nodejs/1CnOzd352JE>

Let's say you have this in your server.js file:

if (process.env.SERVER === "PRODUCTION") { .. produce stuff .. }


There are many ways to set environment variables.

You can set them on the command line for just one command:

$ SERVER=PRODUCTION node server.js

You can export them into your shell environment:

$ export SERVER=PRODUCTION
$ node server.js

You can export them from a shell script:

# foo.sh
export SERVER=PRODUCTION

$ source foo.sh # not ./foo.sh! that would run in a subshell
$ node server.js

You can pass a key-value list to the "env" command:

$ echo SERVER=PRODUCTION >> server-profile
$ echo FOO=bar >> server-profile
$ env $(cat server-profile) node server.js

If you're starting your program with node's child_process.spawn, you
can pass them on the options object:

child_process.spawn("node", ["server.js"], { env: { SERVER: "PRODUCTION" }})

If you're starting your program with execp in C, you can use the
"environ" extern.

extern char **environ;
int main (int argc, char** argv) {
  char **saved_env;
  int ret;
  saved_env = environ;
  environ = { "SERVER=PRODUCTION" };
  ret = execvp("node", { "server.js" });
  environ = saved_env;
  return ret;
}

If you're loading your program from your bash login shell, you can put
this in your ~/.bashrc:

export SERVER=PRODUCTION

If you're running it with SMF, you can put this in your manifest xml:
<method_environment>
  <envvar name="SERVER" value="PRODUCTION"/>
</method_environment>


There are probably other ways to set environment vars.  "man sh" and
"man bash" have sections on this.

Environs are a pretty core Unix feature.  Think of it like another set
of arguments to your program.

---

Depends on your shell's syntax for environment variables (google  
that), but typically:

$> JOBS=123
$> export JOBS
$> node
 > process.env["JOBS"]
'123'

---
It's just a plain js object: 

process.env['JOBS'] = 8; // Set 
console.log(process.env['JOBS']); // Get

---
if (process.env.DEVELOPMENT) {
// setup devel stuff
}
else if (process.env.TESTING) {
// setup testing stuff
}
else {
// assume production
}

then start in bash as: DEVELOPMENT=1 node code.js


