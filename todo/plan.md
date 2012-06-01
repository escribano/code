### call


upload limit per user

org styles

model item: original/translated, forked, submited, draft, private, user_creator
fork
upload file name
person profile image url

dashboard: reblog, submit, draft, private
dashboard item: more edit options: creator, date, rights
dashboard item: more system options: user_creator
creator, date, description, language, rights, title, type
dashboard [dropdown: link, audio, container, form]
dashboard [link selected lib]
dashboard [private, reblogged, draft, libname]
dashboard [creator, date, description, rights, creator_image_path, caption for images...] mime, type
tags layout
dashboard [translation]: english, portugues, francais, espanol, italiano, deutsch {bruno, thiago}
confirm only if changed, listeners
dashboard [multi-upload]: david
dashboard [link posts] multi regex id params route, url_for param regex

themes n homes
home [languages, logo, menu, home poster, home thumbs, calling, home sidebar]

create lib form, map, issue, acervo, catalog, ticket
libs [about, system, event, help, home, profile, inbox, blog, project, (catalog, collection)]
create lib person to inbox
explore users lib

meta [markdown modules, marked]

project [isotope]: caue
issues [ie7,8 posts index mansonry 3 cols e nao cinco]: https://github.com/desandro/isotope
https://github.com/desandro/masonry


client: socket.io, isotope, mansonry, jquery-ui, jquery-ujs, humane

only req, res -> controller
models do not use app
require from cwd when outsiding app
validator i18n

build, coverage, test

refactor config - base and app
load models, controllers, routes
assets
assets [config, minify, gzipify, concatify, versionify]

hookio
queue for
  mailer, video converter, image optimizer, sound converter, link scrap
  image scrap, video scrap, sound scrap, html scrap, latex
  reblog, submit
socketio
humane
reblog, submit

redis: queue, session, config
postgis: world cities
s3: processed files
ebs: original files
mongo redis daemon
nconf-redis

system [dashboard, admin users, jquery_ujs update user]: guardian
project/view/postid, item/view/id, tags projects
install [migration item processed video and image]: {bruno} convert version

meta [cauth, authz, cluster, form, md2html, namespace, registry, user-agent, accept-languages, lang]
packages
  assets, auth, cluster, ansicolor, commander, compile, convert, optimize, email, form
  hooks main, commander, mailer, transloader
  kue
  mdrender
  assets compiler, moongose-express, namespace, tree, authz mid, cache, langue, theme, agent
  versionator
  

#
https://github.com/visionmedia/express/tree/master/examples/view-locals
res.locals.use
https://github.com/visionmedia/express/issues/1120
https://github.com/visionmedia/express/commit/dd33ef2eb6570881262105a7f73442759039c46e

app.routes
https://github.com/visionmedia/express/issues/887
https://github.com/visionmedia/express/commit/18cdb3d845313c7da77e2b3c3f86081129804f7a

added 404 and 5xx pages to mvc example
https://github.com/visionmedia/express/tree/master/examples/mvc
https://github.com/visionmedia/express/commit/fa746cc027e37e1d521d8f237f775804311bcf76

https://github.com/jashkenas/docco
https://github.com/Vizzuality/cartodbtileserver

Hook.io hook for talking to Postgres
https://github.com/paulbellamy/hook.io-postgres
