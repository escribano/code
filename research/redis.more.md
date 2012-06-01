redis-cli keys "*"
redis-cli get "call:hooks:mailer:password"
redis-cli shutdown


You can try to restart redis server through init.d:

/etc/init.d/redis-server restart
or stop/start it:

/etc/init.d/redis-server stop
/etc/init.d/redis-server start

----

A cleaner, more reliable way is to go into redis-cli and then type shutdown

In redis-cli, type help @server and you will see this near the bottom of the list:

SHUTDOWN - summary: Synchronously save the dataset to disk and then shut down the server since: 0.07

And if you have a redis-server instance running in a terminal, you'll see this:

User requested shutdown...
[6716] 02 Aug 15:48:44 * Saving the final RDB snapshot before exiting.
[6716] 02 Aug 15:48:44 * DB saved on disk
[6716] 02 Aug 15:48:44 # Redis is now ready to exit, bye bye...


----

I don't know specifically for redis, but for servers in general:

What OS or distribution? Often there will be a stop or /etc/init.d/... command that will be able to look up the existing pid in a pid file.

You can look up what process is already bound to the port with sudo netstat -nlpt (linux options; other netstat flavors will vary) and signal it to stop. I would not use kill -9 on a running server unless there really is no other signal or method to shut it down.

----

Try killall redis-server. You may also use ps aux to find the name and pid of your server, and then kill it with kill -9 here_pid_number.