noflo = require 'noflo'

class TurnClockwise extends noflo.Component
  constructor: ->
  
    @speed = 0.5
    @inPorts =
      speed: new noflo.Port 'number'
      client: new noflo.Port 'object'
    @outPorts =
      client: new noflo.Port 'object'

    @inPorts.speed.on 'data', (@speed) =>
    
    @inPorts.client.on 'data', (client) =>
      unless client.clockwise
        throw new Error 'Client unable to turn'

      # Start turning
      client.clockwise @speed
      
      # Pass client to the output port immediately
      @outPorts.client.send client
      @outPorts.client.disconnect()

exports.getComponent = -> new TurnClockwise
