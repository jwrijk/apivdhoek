_     = require "underscore"
debug = (require "debug") "app:api:v1:actions"
S     = require "string"

actions =
	"led": require "./led"

module.exports = (req, res, next) ->
	log = req.app.get "log"

	{ action, identity } = req.params

	debug "Reveived action `#{action}` for identity `#{identity}`"
	debug "Received action body", req.body

	unless actions[action]
		res.status 404
		return next new Error "API action `#{action}` not implemented"

	actions[action] identity, req, (error, data) ->
		if error
			res.status 500
			return next new Error error.message

		debug "API action `#{action}` success"

		res.data = data

		next null
