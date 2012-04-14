## Todo

### dispositio

tar -ztvf `npm pack`

npm uninstall meta && npm install `npm pack ~/code/escribano/meta` && make runlocal

npm uninstall meta && npm install `npm pack ~/code/escribano/meta`
npm uninstall meta && npm install `npm pack ~/code/escribano/meta` && make runlocal

npm cache clean
npm pack meta
tar -ztvf meta-0.0.2.tgz

npm pack meta && tar -zxvf meta-0.0.2.tgz 

npm uninstall meta && npm pack ~/code/escribano/meta | npm install

cd dist
npm pack ~/code/escribano/meta
tar -zxvf meta-0.0.2.tgz 
npm install ~/code/escribano/dist/meta-0.0.2.tgz 

tar -zxvf meta-0.0.3.tgz

npm pack [<pkg> [<pkg> ...]]
For anything that's installable (that is, a package folder, tarball, tarball url, name@tag, name@version, or name), this command will fetch it to the cache, and then copy the tarball to the current working directory as <name>-<version>.tgz, and then write the filenames out to stdout.
  
npm install (with no args in a package dir)
npm install <tarball file>
npm install <tarball url>
npm install <folder>
npm install <name>
npm install <name>@<tag>
npm install <name>@<version>
npm install <name>@<version range>
  
  Global setup:
   Set up git
    git config --global user.name "Your Name"
    git config --global user.email ademir.escribano@gmail.com

  Next steps:
    mkdir code
    cd code
    git init
    touch README
    git add README
    git commit -m 'first commit'
    git remote add origin git@github.com:escribano/code.git
    git push -u origin master

  Existing Git Repo?
    cd existing_git_repo
    git remote add origin git@github.com:escribano/code.git
    git push -u origin master

  Importing a Subversion Repo?
    Check out the guide for step by step instructions.

  When you're done:
    Continue