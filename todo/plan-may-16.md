du -hsx /*
tiny css - dashboard/base_text_editor.jade
social js
event view data jade > model
include projects map google api js, cities data
google api config
page/programme text
view gallery vs blog view gallery
'local' in assets path
shim ie7 para assets control

jade avec block/includes
client side: 
  https://github.com/visionmedia/page.js
  https://github.com/mtrpcic/pathjs
  
forms:
  issue:
    fix i18n express-form/field
    express-form res.locals
  options:
    https://github.com/chriso/node-validator
    https://github.com/jzaefferer/jquery-validation
    https://github.com/posabsolute/jQuery-Validation-Engine
    https://github.com/rickharrison/validate.js
    https://github.com/dandean/express-form


autohook
hook fork item
design,code -> develop
leon: doc code
caue: devguide
hook notify -> app
file-utils -> package indep app


### model 

item
original/translated
forked virtual
forked_from
reblogged virtual
reblogged_from
submited virtual
submited_to
draft, private, published
user_creator
upload file name
trashed
caption for images
translator
container_layout

item ops
fork -> hook
move
remove

person
profile image url
upload limit per user: photo, video, docs, other


theme
lib, view, views

### dashboard

inline labels: reblogged, private, draft, submited, libname
badges: posts, drafts {links}
link selected lib

edit: more options:
  creator: user.name
  rights:
  date: now - calendar selector
  original:
  translator: user.name
  layout
    tags 

post
  user_creator: email
  private, draft, published

reblog

submit, inbox
create lib person to inbox
contributor

readmore, hires

dashboard [translation]: english, portugues, francais, espanol, italiano, deutsch
confirm only if changed, listeners

dashboard [dropdown: link, audio, container, form, files, folder]
dashboard [multi-upload]: david
nice ffmpeg, imagemagick
dashboard [history,delete remove file, change remove file, goto trash]
transloader version
install [migration item processed video and image]: {bruno} convert version
create lib person upload

### more

customize
layout, navbar
tinymce images, upload lib

home [languages, logo, menu, home poster, home thumbs, calling, home sidebar]

logo, navbar
font
languages
grid conf 
footer

site admin choose home
templates: jade, mustache
styles: stylus, less

text, photo, video, document
dropdown: link, audio, files, folder, event, issue, book, location(mapview), message, city, quote
open folder, files upload inside folder

special item: folder
item: text, photo, video, document, link, audio, quote
extended item: event, issue, book, location, message, city

event: name, title, coord, address, date
issue: title, description, [status, assignee, issue_type, version]
message: name, email, country, city, organization, phone, message
city: location
book: dublin core
location: name, title, coord, address, link

home
about: overview, the project
- about item: text, photo, video, document, folder
city: sao paulo
- city item: city
project: selected projects
- project itemL text, photo, video, document, folder
event: jornadas
- event item: text, photo, video, document, folder, event, location
blog: news
- post: text, photo, video, document, link, audio, folder
link: network
- link item: link, photo, text
catalog: archive
- catalog item: text, photo, video, document, folder, book

upload: site, user
inbox: site contacts, user messages
profile: user photo, site home
system: press-release, flier, quote, guide, anouncements, images
help

theme
home, about, projects, events, blog, links, cities, catalog

index, list
view, show
edit

model: 
controller:method -> template
lib:method -> theme

fallback: view, assets/src, public, locales
otherwise: app/themes
  templates, styles, images, scripts, locales
study getlocal + render

lib assets: less, jade, img, coffee
check render absolute path
less + jade per lib user

home
banner
blogroll
sidebar

about, item
project

events, event
blog, post
explore links


city saopaulo
cities
cities, city
projects

timezone model
event model, lib

regex url_for
paging
config marked
org styles
admin user: createlib, uploadlimits
normalize routes
user profile
lib settings
user create lib, delete lib, setting lib

### more

dashboard [compose album, create container, folder]
create folder post vs create folder bar
container [bar, posts container view projects, create container, subject_order]

dashboard [choose image layout: photoroll, mosaic, slideshow]: image, document, audio, link


### more

dashboard [link posts] multi regex id params route, url_for param regex

paging blog(types), dashboard
paging [blog (read more in sections), dashboard, explore]
gallery fullscreen transition
social [likes, share, share twitter]: language sensitive, layout
blog [unico video]
config marked

explore [links, audio, album, featureds, archive, cities, projects, +users]
dashboard [explore user's blogs and project]

dashboard [mass post editor]
project [multi-view]

org styles
user pref profile image

system [dashboard, admin users, jquery_ujs update user]: guardian
project/view/postid, item/view/id, tags projects


### inventio

themes n homes
home [languages, logo, menu, home poster, home thumbs, calling, home sidebar]

create lib form, map, issue, acervo, catalog, ticket, upload, inbox
libs [about, system, event, help, home, profile, inbox, blog, project, (catalog, collection)]
explore users lib

meta [markdown modules, marked]

project [isotope]: caue
issues [ie7,8 posts index mansonry 3 cols e nao cinco]: https://github.com/desandro/isotope
https://github.com/desandro/masonry

docs [devguide]: tags, master, publish, bump version, docs, tickets, tests
validator i18n

issues [ie 7,8 media (ie responsive 7,8)]: https://github.com/scottjehl/Respond
client: socket.io, isotope, mansonry, jquery-ui, jquery-ujs, humane

### framework

only req, res -> controller
models do not use app
require from cwd when outsiding app

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

redis: queue, session, config
postgis: world cities
s3: processed files
ebs: original files
mongo redis daemon
nconf-redis

### packages


meta [cauth, authz, cluster, form, md2html, namespace, registry, user-agent, accept-languages, lang]
packages
  assets, auth, cluster, ansicolor, commander, compile, convert, optimize, email, form
  hooks main, commander, mailer, transloader
  kue
  mdrender
  assets compiler, moongose-express, namespace, tree, authz mid, cache, langue, theme, agent
  versionator
  

### links

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




