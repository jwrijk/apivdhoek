winston = require "winston"

console = new winston.transports.Console
			timestamp: true
			colorize:  true

module.exports = new winston.Logger transports: [
	console
]
