noflo = require 'noflo'

class Wait extends noflo.Component
  constructor: ->
    @delay = 500
    @inPorts =
      delay: new noflo.Port 'integer'
      client: new noflo.Port 'object'
    @outPorts =
      client: new noflo.Port 'object'

    @inPorts.delay.on 'data', (delay) =>
      @delay = parseInt delay

    @inPorts.client.on 'data', (client) =>
      setTimeout =>
        # Pass client to the output port
        @outPorts.client.send client
        @outPorts.client.disconnect()
      , @delay

exports.getComponent = -> new Wait
