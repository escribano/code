
homebrew
Installation

ref
https://github.com/mxcl/homebrew/wiki/installation

Paste this at a shell prompt

````
/usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
````

visite
http://mxcl.github.com/homebrew/

ruby
http://www.ruby-lang.org/en/downloads/

RVM
````
$ bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
````

For the latest instructions on installing rvm, check out [the RVM installation page](https://rvm.beginrescueend.com/rvm/install/). Installing the latest Ruby version with RVM is simply done by typing rvm install 1.9.3. RVM can also install most of the Ruby implementations listed below. To see all supported versions, type rvm list known.

Debian GNU/Linux uses the apt package manager system. (So does Ubuntu.) You can use it like this:

````
$ sudo apt-get install ruby1.9.1
````

Mac OS X

Ruby 1.8.7 is fully supported in Mac OS X Lion as well as many popular Ruby gems (packages). For details, see the [Ruby wiki at MacOS Forge](http://trac.macosforge.org/projects/ruby/wiki).

Mac OS X Tiger is packaged with version 1.8.2 of Ruby, and Leopard ships with 1.8.6, but, for those who haven’t upgraded to Leopard, there are a number of options for installing the latest version of Ruby.

Many people on Mac OS X use [Homebrew](http://mxcl.github.com/homebrew/) as a package manager. It’s really easy to get Ruby:

````
$ brew install ruby
````

Also, since OS X is based on Unix, downloading and installing from the source is just as easy and effective as the other solutions. To help you with installation of new Ruby versions on OS X, it’s probably a good idea to use RVM. Type rvm notes for system-specific information.

For a detailed look at installing Ruby (and Rails), Dan Benjamin’s excellent articles for Tiger, for Leopard, and for Snow Leopard will get you up and running very quickly. On Lion, [this article](http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company) can help you.

redmine

http://www.redmine.org/projects/redmine/wiki/Download

Latest source code
You can checkout the latest source code of Redmine from the Subversion repository hosted at Rubyforge. This is the prefered way to get Redmine if you want to benefit from the latest improvements and be able to upgrade easily.

the repository URL is: http://redmine.rubyforge.org/svn
or clone it from the following mirrors

Mercurial (this is maintained by the community)
https://bitbucket.org/redmine
Git (this is maintained by the community)
https://github.com/redmine/redmine

Redmine version   Supported Ruby versions                 Required Rails version  Supported RubyGems versions
1.4.x             ruby 1.8.7, 1.9.2, 1.9.3, jruby-1.6.7   Rails 2.3.14            RubyGems <= 1.8

Rack 1.1.x is required, 1.1.0 has a bug with quotes (#8416). Database migration would fail with other version.
Mongrel 1.1.5 needs a patch attached to #7688 to work fine with Rails 2.3.11. In case of upgrade, another issue may appear for some time after migration (#7857).

MySQL 5.0 or higher (recommended)
make sure to install the C bindings for Ruby that dramatically improve performance. You can get them by running gem install mysql2. If you have problem installing the mysql gem refer Rails Wiki pages

SCM binaries (eg. svn), for repository browsing (must be available in your PATH). See RedmineRepositories for SCM compatibility and requirements.

RMagick (to enable Gantt export to png image)

http://www.redmine.org/projects/redmine/wiki/RedmineInstall

mongrel vs passenger


http://threebrothers.org/brendan/blog/ruby-1-9-2-on-ubuntu-11-04/
````
#!/bin/bash
sudo apt-get -y install zlib1g-dev libssl-dev libreadline5-dev
libyaml-dev build-essential bison checkinstall
cd /tmp
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.gz
tar xvzf ruby-1.9.2-p290.tar.gz
cd ruby-1.9.2-p290
./configure --prefix=/usr\
            --program-suffix=1.9.2\
            --with-ruby-version=1.9.2\
            --disable-install-doc
make
sudo checkinstall -D -y\
                  --fstrans=no\
                  --nodoc\
                  --pkgname='ruby1.9.2'\
                  --pkgversion='1.9.2-p290'\
                  --provides='ruby'\
                  --requires='libc6,libffi5,libgdbm3,libncurses5,libreadline5,openssl,libyaml-0-2,zlib1g'\
                  --maintainer=brendan.ribera@gmail.com
sudo update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.2 500\
                        --slave   /usr/bin/ri   ri   /usr/bin/ri1.9.2\
                        --slave   /usr/bin/irb  irb  /usr/bin/irb1.9.2\
                        --slave   /usr/bin/gem  gem  /usr/bin/gem1.9.2\
                        --slave   /usr/bin/erb  erb  /usr/bin/erb1.9.2\
                        --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.2
````

http://stackoverflow.com/questions/5108437/install-ror-on-debian-squeeze

First install rubygems, I think it's the only Debian package. Then (as Ruby gems):

rvm (install with it ruby 1.9.2, or Ruby version you want)
bundler
rails
And then you can manage application gems with Bundler.

You don't actually need to install a copy of Ruby to make RVM work - if you install GCC (build-essentials package) and Git (git-core package), then running the shell command specified on the RVM Website will do it. Then you can run "rvm install ruby-1.9.2" to get the latest version of Ruby

You probably don't want to use RVM on a production machine. Its $PATH magic will break in non-obvious places (e.g. cron jobs), and you'll be up a creek.

You could simply build from sources and use checkinstall to create a .deb for yourself. Here's a [tutorial for Ubuntu](http://threebrothers.org/brendan/blog/ruby-1-9-2-on-ubuntu-11-04/) that should translate pretty well into debian.

Have you looked at [railsready-debian-lenny](https://github.com/vysogot/railsready-debian-lenny) (it is claimed to work on Squeeze too)? Don't forget to install dependencies pointed in [readme.md](https://github.com/vysogot/railsready-debian-lenny/blob/master/README.md)








