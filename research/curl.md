http://blogs.plexibus.com/2009/01/15/rest-esting-with-curl/

REST-esting with cURL
I have been working on RESTful web applications over the past few months and have been using cURL to quickly test functionality.

The following are basic curl commands to test REST resources

POSTing data to a REST resource:

curl -i -H "Accept: application/json" -X POST -d "firstName=james" http://192.168.0.165/persons/person  

