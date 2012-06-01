## Todo

overlord1a
gate1a
ldap1a
ldap1b
code1b
issues



db1c, app1c, lb1c ->renova1c
data1b, db1b, app1b, proxy1b -> habisp1b
call1d, call2d, call3d -> calling1b

dev1c, int1c -> renova-dev-1c
dev1b -> habisp-dev-1c
dev2b - calling-dev-1c


### life
diamante
registro.br
francais
vanda
inetbank
remedio

# inventio

http://www.saopaulocalling.org/sao-paulo/project/bamburral


person
person profile image url
app preview face, gg
app production face, gg
new ec2
nodemailer [tuffmail]

cities and maps

require from cwd when outsiding app
divide config between base and app
build and coverage

app.models = load_fn(app, locations.models);
app.middleware = load_fn(app, locations.middleware);
app.controllers = load_fn(app, locations.controllers);
autoconfig locals, middlewares
automount routes
autoload controllers
@get "/path", @controllers.dashboard.index

model, controller, routes
assets [config, minify, gzipify, concatify, versionify]

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

hookio
socketio
humane
master cluster
hooks:
  fork kue
  queue for
    mailer, video converter, image optimizer, sound converter, link scrap
    image scrap, video scrap, sound scrap, html scrap, latex
    reblog, submit
    
    
  Hook.io hook for talking to Postgres
  https://github.com/paulbellamy/hook.io-postgres

libs [about, system, event, help, home, profile, inbox, blog, project, (catalog, collection)]

redis: queue, session, config
postgis: world cities
  https://github.com/brianc/node-postgres
  
  PostgreSQL ORM on top of node-postgres
  https://github.com/didit-tech/FastLegS
  
  A ORM written in Coffeescript that supports multiple database systems (SQL/NoSQL) and ID generation middleware.
  https://github.com/meltingice/node-activerecord
  
  Multi-database ORM: redis, mongodb, mysql, sqlite, postgres, neo4j, memory... Many databases, common API
  https://github.com/1602/jugglingdb
  
mongodb: items, library, users, cities
  Augment your methods with pre and post hooks
  https://github.com/bnoguchi/hooks-js
  
  Added docs on geospatial indexes
  https://github.com/LearnBoost/mongoose/commit/dd8e94634ffc248bc249e4c03dca4280935812e2
  
s3: processed files
ebs: original files
mongo redis daemon
nconf-redis

meta [cauth, authz, cluster, form, md2html, namespace, registry, user-agent, accept-languages, lang]
packages
  assets, auth, cluster, ansicolor, commander, compile, convert, optimize, email, form
  hooks main, commander, mailer, transloader
  kue
  mdrender
  assets compiler, moongose-express, namespace, tree, authz mid, cache, langue, theme, agent
  versionator

config homes et themes
theming [ipad, iphone, mobile]
home [languages, logo, menu, home poster, home thumbs, calling, home sidebar]

repo [slugify]
cookie [language duration config, expires session?]
cookie [expire age sem nome]

create lib form, map
ticket model
issue model
issue lib

create lib acervo

play project
analysis [https]
window.location, document.location

social [follow, comments]
social [feedback, subscribe rss, email, feed/rss/ipad]
share: call this, twitter, facebook
like: login call, twitter, facebook, googleplus
comment: call, facebook, email et name
sender view comments by cookie, waiting for moderation
follow, watch, clone, fork, friend, trust, reblob

docs [devguide]: tags, master, publish, bump version, docs, tickets, tests
docs [spcallingd, config.cson, nginx.conf]
docs [monitor log crash slaves]
meta [error handling]
config [app/assets/assets.production.cson, bin/spcallingd]
assets [style/less/bootstrap]
assets [assets per device]
assets [assetscfg]
assets [compilers]
assets [versionator]
assets [call compile assets include version]
package [assets, fontawsome, versionator]: me

dev [make compile, middle, devreload cron]
dev [add version-commit]
dev [npm install]
dev [npm prune]
dev [git pull, coffees, stylus, less, images, js, css, libs, vendor]
install [redis mac debian compile brew aptitude]



### code

general
docs [org tickets, install docs, code docs comments markdown, upgrade docs ]
tickets, merge design, code
code [better coding, comments markdown, explicit]
tests [early tests, make test]
models do not use app
controllers do not use i18n _
write test to fail before fixing
tickets version 0.0.6

bruno
project/view/postid, item/view/id, tags projects
install [migration item processed video and image]: {bruno} convert version

system [dashboard, admin users, jquery_ujs update user]: guardian
  http://preview.saopaulocalling.org/system/admin/dashboard
  http://localhost:3000/system/admin/dashboard
  http://localhost:3000/system/users

dashboard [translation]: english, portugues, francais, espanol, italiano, deutsch {bruno, thiago}
dashboard [dropdown: link, audio, container]
dashboard [link selected lib]
dashboard [private, reblogged, draft, libname]
confirm only if changed, listeners
dashboard [compose album, create container, folder]
create folder post vs create folder bar
container [bar, posts container view projects, create container, subject_order]
project [multi-view]
new item model localized
dashboard project readmore text view
dashboard [draft]
dashboard [select dashboard all posts lib type blog]
dashboard [creator, date, description, rights, creator_image_path, caption for images...] mime, type

blog tags color, list
paging blog(types), dashboard
paging [blog (read more in sections), dashboard, explore]

explore [project submenu link not going right]: renato
explore [collorbox: gallery one picture]
dashboard [mass post editor]
dashboard [analysis jquery-ui dragdrop container]: bruno
meta [markdown modules, marked]
explore [links, audio, album, featureds, archive, cities, projects, +users]
dashboard [explore user's blogs and project]
create lib person to image url profile
create lib person to inbox
- submit fork
- reblog link
dashboard [reblog]
dashboard [fork, clone, follow, watch]


david
nice ffmpeg, imagemagick
backup [mongodb dump, journaling, backup.sh, backup cron]
docs [index of /data/]
docs [logrotate]
redirect site jornada > spcalling
review uploads

dashboard [multi-upload]: david
dashboard [upload manual, start uploading on create post]: david
dashboard [caption vs description], where [tit, cap]
jqueryupload ip old version
upload file name
transloader version
dashboard [link posts] multi regex id params route, url_for param regex,
route [alias url_for]
dashboard [choose image layout: photoroll, mosaic, slideshow]: image, document, audio, link
dashboard [hires]
dashboard [edit multi image upload]
dashboard [multi photo transmigrate container]
dashboard [analysis transmigrate post]: david
config native for ProxyItem.update
inspect memory consumption
dashboard [file uploader]

config [ga code config]
session store [redis, mongo]
dashboard [use url to img, audio, video, document]
dashboard [text show html tiny]
dashboard [readmore: markitup, tiny ]: david, role debugger
dashboard [history,delete remove file, change remove file, goto trash]
dashboard [csrf]
storage [memcached, cdn, uuids]
explore [html5 video chrome]




caue
controller gettext
contacts [admin, mongoose-types]
map ballon saopaulo
routes
  http://dev2b.develop.habisp.inf.br/dashboard/test/preferences
  http://dev2b.develop.habisp.inf.br/dashboard/test/reblog_text
  http://dev2b.develop.habisp.inf.br/dashboard/test/settings
project [isotope]: caue
issues [ie7,8 posts index mansonry 3 cols e nao cinco]: https://github.com/desandro/isotope
cities [mapa ballon rome mestizo city]
install [error mkdir]

admin contacts, download src
gallery fullscreen transition
colorbox gallery
social [likes, share, share twitter]: language sensitive
blog [unico video]
dashboard [open new window blog/project style]
blog [/blog/type/{articles...}]: caue
blog [limit blog sections]: caue
dashboard [lib image profile]: caue
issues [menu dock hash location]: find md
libs [libs.help, libs.about]
help [first post avec help in my blog and my project]


leon
footer [posts lang]: leon
search [mongoose, solr, tika]: leon
dashboard [kue singleton]: image magick, post check model, convert video,photo {leon}
kuelib 150, process = exec job.data.command
dashboard [search to sidebar]

renato
dashboard enhance
dashboard [view post lib name]
text cortado iphone
issues [ipad broken menu ]
issues [ie dashboard layout broken]
integ habisp
galleries responsive
style [tags spaces]
better layout dashboard, title...
jornadas [link project]: link
issues [ie broken layout dashboard]
bootstrap less [responsive]
blog [cards shadow]: renato {fine}
explore [project page]: bruno
blog [sidebar]
blog [calendar filter]
project item sidebar
dashboard item sidebar
overview
jornadas [enhance]
cities [international call enhance]
cities [international call selection, editor's choice]
cities [international call mapa first, second call avec mosaic]
app/middle/styles/themes/bootcalling/custom.styl


thiago
person [user preferences: text, plain, tiny, markdown], languages and pref order
pref [deep search, autoupload, def slideshow, def lib, debug tiny, upload method, theme]
login [layout ipad]
issues [ie 7,8 media (ie responsive 7,8)]: https://github.com/scottjehl/Respond

juca
lib [blog settings/project setting/evt settings]: sec owner, admin: avec acl, theme
lib [blog settings permite reblog, contribution]
blog [small hero over main blog]: renato, gradient h1
issues [ie8 home manifesto grudado painel principal]
dashboard [reblog, edit, delete, open, submit]
dashboard [edit post submit to (contributor)]
inbox [Your Inbox is an aggregate view of Messages]
inbox [(Questions, Fan Mail, Submissions) that any of your blogs receive.]
inbox [submission queue approval]
inbox [questions, mail]
dashboard [private, publish, draft]: private, published, unapproved, publish, save as draft
dashboard [queue, trash, spam]

mario, malaca
tests [new]: mario, tmalaca
build
app_cov
quality [specs]: mario
mocha coverage

eliene
times video text portuguese
quality [tests ie7,ie8,ie9,ff,ch,sf,op,ipad,iphone,android]: sheila, flavio
tickets para test
quality [buy iphone, ipad protector]: eliene
quality [*sal, servers, *antena, curric, *oracle, iphone, diego]
quality [informar os browsers]
(*) quality [contact test] : caue
quality [test plan - multi browser-devices, langue racing, ipad, multi res, gallery]
quality [testing (langue racing, ipad)]
quality [test iphone, ipad, android]
race change lang
- tests ipad
  - photoswipe scroll










### issues


ie7,8,9 
  tags, source
  upload preview img quebrada
  botao selecionar img,video,doc

supersized button

ie footer azul>preto
ie dropdown 9
ie dropdown bootstrap func 
ie upload photo
transition portrait > landscape  , ocorre no bootsprap


defaultLibraryIdentifier : '' #mixedType
useLayout: true
galeriaDefaultDesktopFullscreen: 'supersized'
galeriaDefaultMsieFullscreen: 'photoswipe'
galeriaChangeEnabled: false
galeriaGalleriaFullscreen: false
languageAge: 604800000 # 7 dias
googleAnalyticsUseDomain: false
googleAnalyticsCode:
  all: 'UA-28684410-1'
  spcalling: 'UA-28684410-1'
  jornada: 'UA-28684410-1'
googleMapsAPI: ''
uuidUploadLevels: 3

preview
http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js
http://raw.github.com/rails/jquery-ujs/master/src/rails.js
http://preview.saopaulocalling.org/images/sequence-preloader.png 404
http://preview.saopaulocalling.org/research/scripts/v0.1.0-alpha/research.js 404
https://raw.github.com/rails/jquery-ujs/master/src/rails.js
=> redirect

