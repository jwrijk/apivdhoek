var express = require('express');
var app = express();
var ppins = require('pi-pins');

var led = ppins.connect(22);
led.mode('out');
led.value(true);

// reply to request with "Hello World!"
app.get('/', function (req, res) {
  res.send('Hello World!');
});

//start a server on port 80 and log its start to our console
var server = app.listen(80, function () {
  var port = server.address().port;
  console.log('Example app listening on port ', port);

});

// Set On / Off interval
var ledToggle = false;
setInterval(function() {
	ledToggle = !ledToggle;
	led.value(ledToggle);
}, 1000)