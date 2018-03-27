_          = require "underscore"
{ Router } = require "express"

leds = [
	{
		id: 1
		title: "Led 1"
		status: "off"
	}
	{
		id: 2
		title: "Led 2"
		status: "off"
	}
	{
		id: 3
		title: "Led 3"
		status: "off"
	}
	{
		id: 4
		title: "Led 4"
		status: "off"
	}
]

router = Router()

router.get("/leds", (req, res) ->
	res.send(leds)
)

router.post("/leds/:id/toggle", (req, res) ->
	id = req.params.id

	led = _.find(leds, function(l) { l.id === id })

	if (!led) {
		return res.send({error: "Kon hem niet vinden!"})
	}

	led.status = if led.status is "on" then "off" else "on"

	# daadwerkelijk de led aansturen met de nieuwe status

	res.send(led)
)

module.exports = router