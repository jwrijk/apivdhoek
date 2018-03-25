{ Router } = require "express"

actions      = require "./actions"
{ handlers } = require "./middleware"

defaultMiddleware = [
	handlers.endHandler
	handlers.errorHandler
]

router = Router()

	return router
		.post "led/:action", actions, defaultMiddleware

router