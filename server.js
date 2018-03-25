var express = require('express');
var app = express();

// reply to request with "Hello World!"
app.get('/', function (req, res) {
  res.send('Hello World!! This is going to be awesome.');
});

//start a server on port 80 and log its start to our console
var server = app.listen(process.env.NODE_PORT || 80, function () {

  var port = server.address().port;
  console.log('Example app listening on port ', port);

});
