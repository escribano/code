redis-server => start
killall -SIGTERM redis-server =>stop

cat /usr/local/etc/redis.conf
For Debian is `/etc/redis/redis.conf`

pro:~ ademir $ brew install redis
Warning: You have Xcode 4.2.1, which is outdated.
Please install Xcode 4.3.
==> Downloading http://redis.googlecode.com/files/redis-2.4.12.tar.gz
######################################################################## 100.0%
==> make -C /private/tmp/homebrew-redis-2.4.12-MdHT/redis-2.4.12/src CC=/usr/bin
==> Caveats
If this is your first install, automatically load on login with:
    mkdir -p ~/Library/LaunchAgents
    cp /usr/local/Cellar/redis/2.4.12/homebrew.mxcl.redis.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

If this is an upgrade and you already have the homebrew.mxcl.redis.plist loaded:
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
    cp /usr/local/Cellar/redis/2.4.12/homebrew.mxcl.redis.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

  To start redis manually:
    redis-server /usr/local/etc/redis.conf

  To access the server:
    redis-cli
==> Summary
/usr/local/Cellar/redis/2.4.12: 9 files, 436K, built in 7 seconds
pro:~ ademir $