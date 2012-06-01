
route, theme, controller, action, view



tiago, mario test
leon docs, tickets
caue theme
- festarch

controllers/festarch copied from controllers/bootcalling
remove index

views/themes/festarch copied from views/bootcalling except dashboard, base_css, etc
- subdir blog, explore
assets/src/styles/themes/festarch copied from assets/src/styles/themes/bootcalling except not used
public/images/themes/festarch copied from public/images except img data
public/styles/themes/festarch copied from public/styles/themes/bootcalling








habisp.org
new.habisp.inf.br

from views import myview
config.add_route('myroute', '/prefix/{one}/{two}')
config.add_view(myview, route_name='myroute')

config.add_route('idea', 'site/{id}')
config.add_view('mypackage.views.site_view', route_name='idea')

config.add_route('idea', 'ideas/{idea}', factory='myproject.resources.Idea')
config.add_view('myproject.views.idea_view', route_name='idea')

url = request.route_url('foo', a='1', b='2', c='3')
url = request.route_path('foo', a='1', b='2', c='3')

dispatch


controller 
  choose view
    lib
    default
  choose service
  collect stats

base controllers, route middlewares

lib
  featured items: fetch in index
  highlights items: idem

item

  title
  description
  translations
    en:
      title
      description
    pt:
      title
      description

route
  name: home
  path: '/'
  method: get
  controller: 'bootcalling'
  action: index
  
  controllers: 
    presentation
      view: 
        'vname'
      action: index
    blogroll
      view: 
        'vname'
  action: index
  view: 'vname'



  home
    get '/'
    controller: 'bootcalling'
    action:"index"
    view: "bootcalling/index"
    as: 'home'
    
  home, get '/', controller: 'festarch', action:"index", view, typelib#id, page#home
  
  home-view
    get: '/view/:identifier'
    controller: 'bootcalling/view'
    action: 'index'
    as: 'view'

  about
    get: '/about'
    controller: 'bootcalling/about'
    action: 'index'
    view: 'bootcalling/about/page'
    as: 'about'
    
  about-show
    get: '/about/:identifier'
    controller: 'bootcalling/about'
    action: 'index'
    as: 'about-page'
  
  blog
    get: '/'
    controller: 'bootcalling/blog'
    action: 'list'
    view: 'bootcalling/blog'
    as: 'blog'
  blog-tag
    get: '/tag/:tag'
    controller: 'bootcalling/blog'
    action: 'list'
    as: 'blog-tag'
  blog-show
    get: '/blog/view/:identifier'
    controller: 'bootcalling/blog'
    action: 'view'
    as: 'blog-view'
    library.user
      item.type
        view: "bootcalling/dashboard/view_text"
        view: "bootcalling/dashboard/view_image"
        view: "bootcalling/dashboard/view_video"
        view: "bootcalling/dashboard/view_document"
        view: "bootcalling/dashboard/view_audio"
        view: "bootcalling/dashboard/view_link"
        view: "bootcalling/dashboard/view_#{item.container_type}"
    library.system
      item.type == 'document'
        redirect item.fileURL
      item.type == 'text'
        view: "bootcalling/blog-view"
      item.type == 'video'
        view: "bootcalling/blog-view"
      item.container_type == 'album' [and item.library_type == 'blog']
        view: "bootcalling/blog-view-gallery"
      item.type == 'container'
        view: "bootcalling/blog-view-container"
    
  projects

  project-show
    get: '/project/:library'
    controller: 'bootcalling/project'
    action: 'list'
    view: 'bootcalling/project'
    as: 'project'
  events
    get: '/events'
    controller: 'bootcalling/events'
    view: 'bootcalling/events'
    as: 'events'
  event-show
    get: '/events/:event'
    controller: 'bootcalling/events'
    action: 'view'
    view: 'bootcalling/events/view'
    as: 'event'
  explore
    get: '/explore'
    controller: 'bootcalling/explore'
    action: 'index'
    view: 'bootcalling/explore'
  explore-photos
    get: '/explore'
    controller: 'bootcalling/explore', action: 'images'
    view: 'bootcalling/explore-images'
    as: 'explore-images'
  explore-albums
    get: '/explore'
    controller: 'bootcalling/explore'
    action: 'albums'
    view: 'bootcalling/explore-albums'
    as: 'explore-albums'
  explore-videos
    get: '/explore'
    controller: 'bootcalling/explore'
    action: 'videos'
    view: 'bootcalling/explore-videos'
    as: 'explore-videos'
  explore-documents
    get: '/explore'
    controller: 'bootcalling/explore'
    action: 'documents'
    view: 'bootcalling/explore-documents'
    as: 'explore-documents'
  explore-links
    get: '/explore'
    controller: 'bootcalling/explore'
    action: 'links'
    view: 'bootcalling/explore-links'
    as: 'explore-links'
  explore-users-blogs
    get: '/explore'
    controller: 'bootcalling/explore'
    action: 'user_blogs'
    view: 'bootcalling/explore-user-blogs'
    as: 'explore-user-blogs'
  explore-users-projects
    get: '/explore'
    view: 'bootcalling/explore-user-projects'
    controller: 'bootcalling/explore'
    action: 'user_projects'
    as: 'explore-user-projects'
  explore-users-blog-show
    get: '/explore/blog/:identifier'
    controller: 'bootcalling/explore'
    action: 'library_listing'
    view: 'bootcalling/explore-library-list'
  explore-users-projects-show
    get: '/explore/project/:identifier'
    controller: 'bootcalling/explore'
    action: 'library_listing'
    view: 'bootcalling/explore-library-list'
  search
    get: '/search'
    as: 'search'
    controller: 'bootcalling/search'
    action: 'index'
    view: 'bootcalling/search/index'
  cities
    get: '/cities'
    as: 'cities'
    controller: 'bootcalling/cities'
    action: 'cities'
    view: "bootcalling/cities/cities"
  city-show
    get: '/city/:identifier'
    as: 'city'
    controller: 'bootcalling/cities'
    action: 'city'
    view: "bootcalling/cities/sao-paulo"
  page-show
    get '/page/:view'
    as: 'page'
    controller: 'bootcalling'
    action: 'view'
    view: "bootcalling/page/#{@req.params.view}"
  contact-edit
    get: '/contact'
    as: 'contact'
    controller: 'bootcalling/contact'
    action: 'index'
    view: 'bootcalling/contact'
  dashboard
     get: '/dashboard'
     controller: 'dashboard/dashboard'
     action: 'index'
     view: "bootcalling/dashboard/index"
  dashboard-others
     @get '/dashboard/others', route.to controller: 'dashboard/dashboard', action: 'view'
  dashboard-others-library
    @get '/dashboard/others/:library', route.to controller: 'dashboard/dashboard', action: 'view_others'
  dashboard-others-library-show
    @get '/dashboard/others/:library/view/:id/', route.to controller: 'dashboard/dashboard', action: 'viewOthersPost'
  dashboard-explore-blogs
    @get '/dashboard/explore/blogs', route.to controller: 'dashboard/dashboard', action: 'list_blogs'
  dashboard-explore-projects
    @get '/dashboard/explore/projects', route.to controller: 'dashboard/dashboard', action: 'list_projects'
  dashboard-tags-autocomplete
  dashboard-new-library
  dashboard-preferences
  dashboard-library-show
  dashboard-library-show-settings
  dashboard-library-show-members
  dashboard-library-show-new-text
  dashboard-library-show-new-link
  dashboard-library-show-new-contenttype-show
  
  
  
  

views:
  type view

theme:
  name: original | festarch
  type view: index, show, edit, search, new
  view
  
type:
  model
  name
  type view
  default view

optimize assets config locals

switch theme
  original (default)
  festarch
  
theme switch inside page right up
create lib network


site inbox
inbox: shared message [owner, admin, editor]
lib inbox:
route middleware

lib
  item_index
  action:
    index: type_id
    show:
    edit:
    search:
    new: 

type
  model:    item | library | person | dashboard
  display_name: 
  name:     blog, project, page, network, tracking, catalog, cities 
            inbox, upload, profile, documents
            text, photo, video, document, audio, link
            files, folder
            quote, event, location, issue, message
            article, book, conference, manual, thesis, report
            magazine
  category: user | system | media | catalog | flow
  view_default:
  views: [{name, view}]
  view_name:
  view_path:
  methods | actions : index | show | edit | search | new
  jquery_ujs:
  client_route
  context: ref type:
  
type
  lib
    user
      blog
      project
      page
      network
      tracking
      catalog
      cities
    system
      inbox
      upload
      profile
  item
    media
      text
      photo
      video
      document
      audio
      link
    system
      files
      folder
    references
      quote
    aspects
      event
      location
      issue
      message
    catalog
      article
      book
      conference
      manual
      thesis
      report

type
  blog
    controllers:
      default:  'bootcalling/blog'
    views:
      default:
        index:      'bootcalling/blog'
        show:       "bootcalling/blog-view"
        edit:
          text:     "bootcalling/dashboard/view_text"
          photo:    "bootcalling/dashboard/view_image"
          video:    "bootcalling/dashboard/view_video"
          document: "bootcalling/dashboard/view_document"
          audio:    "bootcalling/dashboard/view_audio"
          link:     "bootcalling/dashboard/view_link"
          folder:   "bootcalling/dashboard/view_#{post.container_type}"

  project
    controllers: 
      default: 'bootcalling/project'
    views:
      default: 
        index: 'bootcalling/project'
      
  page
  network
  tracking
  catalog
  cities

views
  name
  type
  layout
  navbar
  includes
    panel
    sidebar
  scripts
  styles

type
  name: match typelib
  theme
  template index
  template show
  

lib type
  theme
    template index
    template show
  theme
    template index
    template show
    
lib
  theme


lib       index
lib/:id   show


template index /users
template show
template edit

get /users              index
get /users/new          new
get /users/:user        show
get /users/:user/edit   edit


lib
  language
  translations
  template index | item show
  template show
  template edit
  related libs
  theme
  index fetch [items]
  sidebar fetch [items]
  display name


catalog templates

'about'       '/about'              controller: 'bootcalling/about', action: 'index' render 'bootcalling/about/page'
'about-page'  '/about/:identifier'  controller: 'bootcalling/about', action: 'index' render 'bootcalling/about/page'

list @render 'bootcalling/blog'
view
  "bootcalling/dashboard/view_#{post.container_type}"


lib
  theme/template index
  theme/template show
  
controller read lib, render theme

catalog templates by type lib

lib
  language
  translations
  template index | item show
  template show
  template edit
  related libs
  theme
  index fetch [items]
  sidebar fetch [items]
  display name
  create folder
  multilingual
  user create lib, delete lib, setting lib
  edit lib: private, draft, publish

item
  display name
  related items

site admin
  theme
  theme switch
  languages
  logo
  poster
  navigation
    libs
    navbar
  layout
  font, color
  poster, banner
  blogroll
  sidebar
  grid conf 
  footer

check render absolute path
less + jade per lib user
timezone model
open folder, files upload inside folder

### more

config dynamic-layout-plugin
search posts home masonry, isotope
marked

https://github.com/harvesthq/chosen
https://github.com/jquery/jquery-ui
https://github.com/mishoo/UglifyJS
https://github.com/addyosmani/jquery-ui-bootstrap
https://github.com/scottjehl/Respond

datepicker
https://github.com/freqdec/datePicker
https://github.com/eternicode/bootstrap-datepicker
https://github.com/Aymkdn/Datepicker-for-Bootstrap

calendar
https://github.com/arshaw/fullcalendar
https://github.com/jonthornton/jquery-timepicker

route -> controller -> method -> view

route home
lib home n
controllers/folder/index#index
render
template

lib
  theme/template index
  theme/template show
  theme/template edit
  
  
calendar
  


explore users blog n projects n stuff inside dashboard
manage user inside dashboard
plus
site config
theme
home
navigation

user theme

navigation lib




### items

inbox, upload, profile

blog, project, page, issue, network, catalog, city

event, location, network

text, photo, video, document, audio, link
files, quote, event, location, folder, issue, message
article, book, conference, manual, thesis, report

files
quote
event: name, title, coord, address, date
location: coord, address, link, name, title
article, book, conference, manual, thesis, report
folder
message: contact[name, email,phone, organization], location[city], message, status, assignee, category
issue: title, description, status, reporter, assignee, category, issue_type, version

embbed: event, location, message, issue, bibitem





model: 
controller:method -> template
lib:method -> theme

index, list
view, show
edit



### more

author, title, pubdate, editor, address, edition, note
author, title, journal, year, editor, publisher
volume, number, pages

article: author, title, journal, year | volume, number, pages, month, note, key
book: author/editor, title, publisher, year | volume/number, series, address, edition, month, note, key
conference: author, title, booktitle, year | editor, volume/number, series, pages, address, month, organization, publisher, note, key
manual: title | author, organization, address, edition, month, year, note, key
thesis: author, title, school, year | type, address, month, note, key
report: author, title, institution, year | type, number, address, month, note, key




### client side

client: socket.io, isotope, mansonry, jquery-ui, jquery-ujs, humane
jade avec block/includes
client side: 
  https://github.com/visionmedia/page.js
  https://github.com/mtrpcic/pathjs

customize
layout, navbar
tinymce images, upload lib

### themes n homes

home [languages, logo, menu, home poster, home thumbs, calling, home sidebar]

logo, navbar
font
languages
grid conf 
footer

site admin choose home
templates: jade, mustache
styles: stylus, less

### libs n items

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
org styles
admin user: createlib, uploadlimits
normalize routes
user profile
lib settings
user create lib, delete lib, setting lib

themes n homes
home [languages, logo, menu, home poster, home thumbs, calling, home sidebar]

create lib form, map, issue, acervo, catalog, ticket, upload, inbox
libs [about, system, event, help, home, profile, inbox, blog, project, (catalog, collection)]
explore users lib