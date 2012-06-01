<http://superuser.com/questions/69130/where-does-path-get-set-in-os-x-10-6-snow-leopard>

Where does $PATH get set in OS X?

echo $PATH

easiest solution when you want to make a site-wide path change (e.g. to include /usr/libexec or whatever) is to edit /etc/paths . While the new /etc/paths.d/ thing is functional, it's actually more hassle than maintaining a single file. As others have hinted but not spelled out, if the path changes you want would be useful only for one user, it's best to make that change in the bash and/or tcsh config files in that user's home directory instead of system-wide.

When bash starts it reads the following files every time you login. For the purposes of OS X, this means every time you open a new Terminal window.

/etc/profile
~/.bash_profile
~/.bash_login   (if .bash_profile does not exist)
~/.profile      (if .bash_login does not exist)

When you start a new shell by typing bash on the command line, it reads .bashrc

Finally, OS X also uses [~/.MacOSX/environment.plist](http://developer.apple.com/mac/library/qa/qa2001/qa1067.html) to set more environment variables, including paths if necessary.

/opt/local/bin etc. are added in ~/.tcshrc by MacPorts. Also be sure to look in ~/.cshrc.

Apparently, ~/.MacOSX/environment.plist does not work for some people. In [Change Path for OS X](http://superuser.com/questions/97498/change-path-for-os-x/97525#97525) an alternative by using the folder /etc/paths.d is described. I've not tested that.

it was /etc/paths for me, using OS X 10.7.4
 
Take a look at the file /etc/paths, which is used by /usr/libexec/path_helper, which is used by /etc/profile. For MacPorts, use "sudo" to append "/opt/local/bin" to the end of the /etc/paths file and reopen the terminal window.


launchd
https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man8/launchd.8.html#//apple_ref/doc/man/8/launchd

launchctl
https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/launchctl.1.html#//apple_ref/doc/man/1/launchctl

launchd.plist(5)
https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man5/launchd.plist.5.html#//apple_ref/doc/man/5/launchd.plist

~/Library/LaunchAgents         Per-user agents provided by the user.
/Library/LaunchAgents          Per-user agents provided by the administrator.
/Library/LaunchDaemons         System-wide daemons provided by the administrator.
/System/Library/LaunchAgents   Per-user agents provided by Mac OS X.
/System/Library/LaunchDaemons  System-wide daemons provided by Mac OS X.