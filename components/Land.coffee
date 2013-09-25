noflo = require 'noflo'

class Land extends noflo.Component
  description: 'Commands the AR.Drone to land immediately'
  constructor: ->
    @inPorts =
      client: new noflo.Port 'object'
    @outPorts =
      client: new noflo.Port 'object'

    @inPorts.client.on 'data', (client) =>
      unless client.land
        throw new Error 'Client unable to land'

      # Initiate landing
      client.land =>
        # Pass client to the output port once landed
        return unless @outPorts.client.isAttached()
        @outPorts.client.send client
        @outPorts.client.disconnect()

exports.getComponent = -> new Land
