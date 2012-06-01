http://www.devthought.com/2012/02/17/npm-tricks/#more-1444

Linking

Sometimes you’re developing two or more modules at once, and at least one of them depends on the other. And often times, in order to be able to publish the module to NPM, you need to ensure the modules that depend on it work OK prior to publishing.

You can leverage npm link to generate a global reference to a module, and then run npm link <package>
to install it in other modules. Consider the following example, in which moduleB depends on the version of moduleA you’re currently developing, and moduleB specifies "moduleA" as a dependency in its package.json

````
$ cd moduleA/
$ npm link
$ cd ../moduleB

# if moduleB package.json is pointing to a yet-unpublished
# version of moduleA, npm install will fail:
$ npm install

# this will install your local version of moduleA
$ npm link moduleA

# since moduleA is now installed, npm install will ignore it:
$ npm install
````

Production flags

When deploying, you want npm install to be as fast as possible. To make sure NPM doesn’t waste time installing devDependencies, use the --production option:

````
$ npm install --production
If you’re logging its output, you also want it to only output the absolutely necessary.

$ npm install --loglevel warn
````

Git dependencies

If you haven’t published a certain package to the NPM registry, or you can’t because it’s a private module, you can point to a git:// URI instead of a version number in your package.json:

````
"dependencies": {
    "public": "git://github.com/user/repo.git#ref"
  , "private": "git+ssh://git@github.com:user/repo.git#ref"
}
````

The #ref portion is optional, and it can be a branch (like master), tag (like 0.0.1) or a partial or full commit id (thanks @Roman for pointing this out). I recommend you use git tags as references to ensure npm install always keeps the module up to date.


