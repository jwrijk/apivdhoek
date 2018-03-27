bodyParser     = require "body-parser"
config         = require "config"
debug          = (require "debug") "app:api"
express        = require "express"
helmet         = require "helmet"
http           = require "http"
methodOverride = require "method-override"
morgan         = require "morgan"

log   = require "./log"
apiv1 = require "./api/v1"
apiv2 = require "./api/v2"

app    = express()
server = http.createServer(app)

app
	.set "log", log
	.use morgan "dev"
	.use helmet()
	.use bodyParser.json()
	.use methodOverride()
	.use bodyParser.urlencoded extended: false

	.use("/api/v1", apiv1)

	.get "/test", (req, res) ->
		res.json({ je: "moeder" })

	.post "/test", (req, res) ->
		body = req.body

		# put this in the db...

		res.json({ status: "ok" })


server.listen config.api.port, (error) ->
	log.info "Started API on port #{config.api.port}"
