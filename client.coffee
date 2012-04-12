http = require("http")

times = 50

while times--

  req = http.request(
    port: 3000
    method: "POST"
    headers:
      "Content-Type": "application/x-www-form-urlencoded"
  )

  req.on "response", (res) ->
    console.log res.statusCode

  n = 500000
  req.write "foo=bar&bar=baz&"  while n--
  
  req.write "foo=bar&bar=baz"
  req.end()
