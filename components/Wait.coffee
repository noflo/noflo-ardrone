noflo = require 'noflo'

# @runtime noflo-nodejs

class Wait extends noflo.Component
  description: 'Holds the client connection until the given timeout elapses
  and then passes it forward'
  constructor: ->
    @delay = 500
    @inPorts =
      delay: new noflo.Port 'int'
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
