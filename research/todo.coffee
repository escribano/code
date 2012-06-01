calling = \
"""

https://github.com/documentcloud
https://github.com/documentcloud/visualsearch
https://github.com/documentcloud/underscore
https://github.com/documentcloud/backbone

Chosen is a library for making long, unwieldy select boxes more friendly
https://github.com/harvesthq/chosen

A professional front-end template that helps you build fast, robust, adaptable, and future-proof websites.
https://github.com/h5bp/html5-boilerplate

JavaScript toolkit for creating interactive real-time graphs
https://github.com/shutterstock/rickshaw
 
CSS3 list scroll effects
https://github.com/hakimel/Scroll-Effects
 
jQuery Validation Plugin
https://github.com/jzaefferer/jquery-validation

An interactive console.dir() for the terminal
https://github.com/hij1nx/cdir

A lightning fast JavaScript grid/spreadsheet
https://github.com/mleibman/SlickGrid
 
http://www.squarespace.com/
http://blog.disqus.com/
 
https://github.com/twitter
bootstrap
 
https://github.com/LearnBoost
mongoose
engine.io
socket.io
stylus
node-canvas   
expect.js       

https://github.com/visionmedia
express-namespace
jade
express
nib
mocha
superagent
commander.js
should.js        
debug              

https://github.com/jashkenas
coffee-script
coffee-script-tmbundle 

https://github.com/bnoguchi
everyauth
mongoose-types
mongoose-auth

issues
https://github.com/bnoguchi/mongoose-types/pull/17

     
do not use express-mongoose 
use express3

app.models = load_fn(app, locations.models);
  app.middleware = load_fn(app, locations.middleware);
  app.controllers = load_fn(app, locations.controllers);
    
autoconfig locals, middlewares
automount routes
autoload controllers
@get "/path", @controllers.dashboard.index

assetscfg
assets [compilers]
versionator

cauth
authz

meta

cluster
form
md2html

namespace
registry
style/less/bootstrap
user-agent
accept-languages
lang


tickets, merge design, code
menu dock hash location
user profile [text, plain, tiny, markdown]
session store [redis, mongo]
express 3
new ec2
beta, classic    

sal, servers, *antena, curric, *oracle, iphone, diego
beta stage
informar os browsers

deploy [reinstall coffee 1.3.1, not global]
deploy [migration item>exhib, proj>lib]: bruno

package [assets, fontawsame, versionator]: me

quality [specs]: mario  now
quality [tests ie7,ie8,ie9,ff,ch,sf,op,ipad,iphone,android]: sheila, flavio
quality [buy iphone]: eliene
(*) quality [contact test] : caue
ie footer azul>preto
ie docking 7,8
ie responsive 7,8
ie dropdown 9
ie dropdown bootstrap func 
ie upload photo
ipad broken menu  
transition portrait > landscape  , ocorre no bootsprap



layout [background wallpaper]: renato
layout [calling highlight]: thiago
layout [bootstrap less responsive]: thiago
layout [... name menu]: david
(*) layout [(footer, hero, home) show login only if not logged in, else dashboard], caue

dashboard [login]: thiago
dashboard [logout redirect]: caue
dashboard [photo, video, text]: david
dashboard [lib]: bruno
dashboard [style]: thiago
dashboard [bigger title and text]: renato
dashboard [kue singleton]: leon
dashboard [translation]: {next}
dashboard [photoroll, mosaic, slideshow]
dashboard [hires]
dashboard [csrf]
dashbaard [document, audio]
dashboard [multi image upload]
dashboard [compose album]
dashboard [reblog]: bruno
dashboard [fork, clone, follow, watch]
dashboard [editor main libs]
dashboard [choose image layout]
dashboard [slow file uploader jquery-file-uploader]
dashboard [file uploader]
dashboard [video upload error youtube, layout download]
dashboard [explore user's blogs and project]

home [hero, related posts jornada, panel]: juca
home [vertical menu responsive]: renato
home [subnavbar]: renato

overview [dynamic text]: leon
overview [enhance]

events [jornadas, jornada]: leon
events [blog]

international call [enhance]
{next} international call [selection, editor's choice]

blog [fonte drop shaddow]: renato
blog [posted by vs text]: renato
blog [posted by diversos caso alonso]
blog [titulos galerias]
blog [bigger if unico video, unica imagem, unica galeria de imagem]: renato
blog [bigger font]: renato
blog [better tags post e cloud]: renato
blog [overlay video]: renato
blog [config video entra playing]: renato
blog [divide articles, photos, videos]: renato
(*) blog [controller type-cron, cron, author, event]: caue
blog [more spaces between posts cards]: renato
blog [cards shadow]: renato {fine} 
blog [bigger astracts]: david
blog [tags size not dependent on item but on post, ex ccsp]
blog [small hero over main blog]: renato
blog [latest posts position, paddings]: renato

explore [videos, photos, documents, projects, cities]: bruno
explore [city sao paulo projects]: leon
(*) explore [project page]: bruno
explore [project submenu link not going right]: renato
explore [links, audio, album, featureds, archive]

(*) contact [mongoose-types pkg]: caue
feedback

social [likes, share, follow, comments]

search [mongoose]: leon

footer [posts]: leon
"""

#lines = calling.split '\n'
lines = calling.split /\r\n|\r|\n/
#lines = calling.match(/^.*([\n\r]+|$)/gm)
#lines = calling.match(/^.*((\r\n|\n|\r)|$)/gm)
filteredLines = lines.filter (line) ->
  return line.trim().length > 0
parts = filteredLines.map (line) -> 
  part1 = line.split ':'
  part2 = part1[0].trim().split '['
  part2[1] = part2[1].split("]") if part2[1]
  #l = part2[1].trim().length
  #part2[1] = part2[1].trim().substring(0, l-1)
  part3 = part1[1].trim() if part1[1]
  part2.concat(part3)
console.log parts
