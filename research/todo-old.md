
### datacenter, operating
- route53 ec2 ip, www, dual rr
- server rackspace
- ec2 stage 1d
- datacenter
  - route53
  - habisp domain com.br, inf.br
  - goddady
- 
- stylus nib jade



country:{ 
        code2:'CH', 
        nrlang:2, 
        default:'us_en', 
        countryname:{ 
            'ch_de': 'Schweiz', 
            'us_en': 'Switzerland' 
        }
        


### style
background still
hero background like bootstrap
background h1 bootstrap
search
mosaic cities/projects background of favelas... no painel dinamico
realce favelas ... no hero home
link para dashboard menu
back to top


jornadas instead
language italiano menu side 
change color pale blue bar
user preferences



### model

  
### data


home  - home [boeri, sequence, leite, franca]
overview - about
jornadas - events
international call - cities
blog - system blog
projects - system projects

### routes
/, root

/about
/about/text/manifesto
/view/about-manifesto, manifesto
/about/text/a-sun-for-everyone
/about/text/sao-paulo-calling
/view/about-index, bete
/about/text/bio
/about/text/credits
/about/document/guide-hires
/about/document/guide-lowres

/events, jornadas
/event/sao-paulo-sao-francisco, jornada-sao-francisco
/view/events/sao-francisco, jornada-sao-francisco
/view/events/paraisopolis, jornada-paraisopolis
/view/events/cantinho-do-ceu, jornada-cantinho-do-ceu

/page/international-call, international
/cities, cities
/city/sao-paulo
/page/sao-paulo-call, city-sao-paulo
/city/rome
/city/mumbai
/city/medellin
/city/nairobi
/city/moscow
/city/baghdad

/blog
/blog/tag/sao-francisco, blog-sao-francisco
/blog/articles
/blog/type/photos
/blog/type/videos
/post/postid

/explore, explore
/explore/videos, videos
/explore/images, photos
image panel
/explore/albums, galleries
/explore/documents, documents
/explore/cities
/explore/city/id/projects
/explore/projects
/project/rome, project-mestizo-city
/project/mumbai, project-user-generated-city
/project/medelin, project-pui
/project/nairobi, city-nairobi -> project-upside-down-nairobi
/project/moscow, city-moscow -> project/moscow-pos-ocupation
/project/baghdad, city/baghdad -> project/hidden-city

/dashboard, dashboard
/logout, logout
/authz, login
/preferences, preferences
/set/lang/en
/set/lang/pt

bio, credits, guide hi-low
partners list
facebook, twitter, rss

sao francisco book
ipad app
contact us
privacy
security








### next





### authz
- facebook auth, twitter auth
- org g,f,t,gh
- twitter, facebook, github, google, password
- admin - roles et meta
  - roles
  - context
- user registration et login
- mongoose-auth
  - person
  - bin/call setadmin
      - "slug" : "ademirescribano"
      - , "twitterScreenName" : "AdemirEscribano"
      - , "name" : "Ademir Escribano"
  - twitter dev, facebook dev
  - spcalling dev
  - spcalling org
  - jornada dev
  - jornada org


### installing
- install calling
- move mongo db to ebs
  - sudo du -hs /var/lib/mongodb
    - 3.3G	/var/lib/mongodb
- chmod -R go+rX /mnt/calling/data/original/sao-paulo/cantinho-do-ceu/
  - do not abort on error
- data ebs
- ec2 production call1d
- ebs size






## calling

reinstall coffee 1.3.1
not global
migration [item>exhib, proj>lib], bruno

fontsawsome [assets, versionator], me



layout [background wallpaper], renato
layout [calling highlight], thiago
login, thiago
logout redirect, caue
responsive, thiago

layout [... name menu], david

dashboard [photo, video, text], david
dashboard [lib], bruno
dashboard [style], thiago
dashboard [bigger title and text], renato


home [hero, related posts jornada, panel], juca
home [vertical menu responsive], renato

overview [dynamic text], leon

events [jornadas, jornada], caue

international call [enhance]

blog [fonte drop shaddow], renato
blog [posted by vs text], renato
blog [posted by diversos caso alonso]
blog titulos galerias
blog [bigger if unico video, unica imagem, unica galeria de imagem], renato
blog [bigger font], renato
blog [better tags post e cloud], renato
blog [overlay video], renato
blog [config video entra playing], renato
blog [divide articles, photos, videos], renato
blog [controller type-cron, cron, author, event], caue

explore [videos, photos, documents, projects, cities], caue
explore [city sao paulo projects], leon
explore [project page], bruno, 1

contact [mongoose-types pkg], caue

search


--- 

### test
check amanda, mime, landscape
revisite jade version

dashboard [list lib owner, admin, editor, contributor]
dashboard/id
*layout [... name menu]: david

bootcalling to root
config.responsible
if person
  adoptOrfanedLibraries(person)
  recollectOrfanedItems(Library)








### install
deploy [reinstall coffee 1.3.1, not global]
deploy [migration item>exhib, proj>lib]: bruno
(*) contact [mongoose-types pkg]: caue

### codestyle

+ reblog

### dashboard




### jornadas
events [jornadas, jornada]: leon
events [blog]   

### international call


### blog
blog [divide articles, photos, videos]: renato 
blog [small hero over main blog]: renato 
backbone latest posts

