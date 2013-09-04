noflo = require 'noflo'

class Takeoff extends noflo.Component
  constructor: ->
    @inPorts =
      client: new noflo.Port 'object'
    @outPorts =
      client: new noflo.Port 'object'

    @inPorts.client.on 'data', (client) =>
      unless client.takeoff
        throw new Error 'Client unable to take off'

      # Initiate takeoff
      client.takeoff =>
        # Pass client to the output port once airborne
        @outPorts.client.send client
        @outPorts.client.disconnect()

exports.getComponent = -> new Takeoff
