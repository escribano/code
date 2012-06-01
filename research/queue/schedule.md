https://groups.google.com/forum/?fromgroups#!topic/nodejs/4m5bCCH7QTk

Hey all,

I've been having just so much fun with Node that I thought it was time to give something back. Introducing node-schedule:

http://github.com/mattpat/node-schedule

node-schedule is a cron-like (and not so cron-like) job scheduler for Node. You can schedule tasks using a familiar cron syntax…
var j = schedule.scheduleJob('0 17 ? * 0,4-6', function(){
    console.log('Today is recognized by Rebecca Black!');
});
… or using a convenient object literal syntax:
var j = schedule.scheduleJob({hour: 14, minute: 30, dayOfWeek: 0}, function(){
    console.log('Time for tea!');
});
You can even pass in a JavaScript date object for a one-shot scheduled execution, and do funky things with ranges and timesteps.

Available in npm and on Github. Enjoy!

---

Cool I see you are computing the next execution time given all constraints. This is much better than some implementations where they are iterating through all jobs every single minutes to find matches.
I'm going to use this :)