bodyParser     = require "body-parser"
config         = require "config"
debug          = (require "debug") "app:api"
express        = require "express"
helmet         = require "helmet"
http           = require "http"
methodOverride = require "method-override"
morgan         = require "morgan"

log = require "./log"
api = require "./api/v1"

app    = express()
server = http.createServer app

app
	.set "log", log
	.use morgan "dev"
	.use helmet()
	.use bodyParser.json()
	.use methodOverride()
	.use bodyParser.urlencoded extended: false
	.use "/api/v1", v1

server.listen config.api.port, (error) ->
	log.info "Started API on port #{config.api.port}"
