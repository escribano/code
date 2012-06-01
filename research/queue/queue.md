https://groups.google.com/forum/?fromgroups#!topic/nodejs/VfUY9oC3zas

http://transloadit.com/

you could use zmq (or similar), use PUSH/PULL sockets to distribute 
the work among some works within the machine or network. Lots of 
options depending on how you want to tackle things, if time is not a 
huge issue you could just use a job queue and control concurrency

---

If you run it with "nice" to lower the cpu priority you should have no problem.  We are doing the exact same thing with imageMagick and ffmpeg.  We aren't in production yet but it looks good in testing.  With a lot of conversions running the cpu pegs at hundred percent, but the pages serve fast anyway.

---

nice is a linux command that lets you run any other command with a controlled execution priority.   

[http://linux.about.com/library/cmd/blcmdl1_nice.htm ](http://linux.about.com/library/cmd/blcmdl1_nice.htm)

We don't use a node module, we spawn the linux task ourselves with spawn or exec.  However, it you look at the source code for node-imagemagick it should be easy to find where the linux command is and slip in the nice command.  The node-imagemagick module may already support nice.  The fluent-ffmpeg node module does.

We also put a limit that any one user can only can have two processing jobs going at once.  This makes things more fair for other user's processing.

---

This sounds like a serious 'general principle' question rather than an "arggh help" question so I'm sure you're already aware of this, but for the sake of archive posterity I feel like I should mention using a third party service e.g. Transloadit for this sort of job.

I've tried using node-imagemagick, which is butt-clenchingly powerful, but it comes with a set of infrastructure and data management challenges that often aren't worth spending application development time on. On top of that you may have to get cosy with the command line arguments if you aren't already.

[Disclaimer: My third client implementation makes me a serial customer of theirs. I would probably stick a Transloadit sticker on my laptop so I guess that makes me a fanboy]

If the image processing is a core part of your business then my general recommendation would be to be doing image processing on a different machine with some kind of shared storage and a message broker (as tj suggests). I'd probably use rabbitmq over 0mq but you could just as easily use a load balancer, DB table, or whatever else you had to hand... message queues are often overkill (and an extra infrastructure headache) for these types of things.

---

> [Disclaimer: My third client implementation makes me a serial customer of theirs. I would probably stick a Transloadit sticker on my laptop so I guess that makes me a fanboy]

Thanks : ). Glad to hear our service is working well for you!

For those determined to engineer their own solution, here is some advise regardless:

Using `nice` will help in the beginning, but if you get serious load, you'll end up with a *lot* of processes, and while they may not be able to eat up your CPU, they will eat up your memory, and the OOM Killer will decide who has to pay for it. Before that however you're likely to swap which will bring all your disk I/O to a crawl. Using nice in addition with a queue / similar however can be ok.

Monitor your child processes: We've seen image magick, ffmpeg and various other command line utilities entering states where they'll start eating either memory or CPU time like crazy without completing significant or sometimes any amount of work. You need to be able to detect this and kill the process you spawned. If you use a node addon / binding, you may not be able to do that unless you do the work in another process, so IMO exec/spawn are your friends.

Use a queue: I'm partial to redis-based queue implementations like https://github.com/technoweenie/coffee-resque or http://learnboost.github.com/kue/, but anything that will allow you to asynchronously process varying workloads with minimal overhead is fine in my book.

Use Amazon S3 as a temporary file system: When you get a new file, put it there (use reduced redundancy if you want to save costs), then let the workers pull the file from S3. You will thank yourself for doing this when it comes to scaling (especially down), as you don't have to keep a reference count for files on your various upload machines.

Use your tools well: You'd be surprised by the performance / quality gains you can get from image magick, ffmpeg and friends by using the right options, so it's definitely worth to do a bit of research in that direction for your particular needs.

As mentioned by Richard: We run a SaaS/IaaS product for these kind of problems over at transloadit.com. It may not fit all use cases, but you can definitely save a lot of development time if your use case is covered.

--fg

PS: I still have nightmares from the last time I used CentOS, but YMMV : ).

---

If you're already using Amazon Web Services for files and storage, you
may also want to look at their Simple Queue Service too. This helps so
that you don't have to host your queuing software yourself whatever
that is. My current project currently uploads the image files to S3,
adds an item to SQS for processing, then another machine grabs the
next item when it becomes available, resizes/processes the file,
uploads it back to S3 and marks the job done. :)

Disclaimer: I wrote awssum which can talk to both S3 and SQS.

    $ npm show awssum