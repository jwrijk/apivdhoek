debug = (require "debug") "app:middleware:handlers"

endHandler = (req, res, next) ->
	{ data } = res

	res.json data

errorHandler = (error, req, res, next) ->
	res.status 500 unless res.statusCode > 399 and res.statusCode < 600

	message = error.message or "Something went wrong"

	debug "Sending error `#{res.statusCode}`: #{message}"

	res.json error: message

module.exports = {
	errorHandler
	endHandler
}
