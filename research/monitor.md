http://godrb.com/

http://blog.acmarques.com/deploying_node_with_nginx_and_god

1) by default its 1.7 gb on 64 bit, but it can be as much as your machines memory with node 0.6
2) use --max-old-space-size flag to set the memory limit lower or higher
3) no they don't share memory
4) I would just check the overall process memory instead of the V8 heap
5) Maybe but you got to build your own custom c module to allocate memory and hack in to the node source.

Automatic and decentralized discovery and monitoring of nodejs instances with built in support for a variable number of master processes, service advertising and channel messaging
https://github.com/wankdanker/node-discover