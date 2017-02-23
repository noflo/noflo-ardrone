noflo = require 'noflo'

# @runtime noflo-nodejs

class Stop extends noflo.Component
  description: 'Makes the AR.Drone stop and hover'
  constructor: ->
    @inPorts =
      client: new noflo.Port 'object'
    @outPorts =
      client: new noflo.Port 'object'

    @inPorts.client.on 'data', (client) =>
      unless client.stop
        throw new Error 'Client unable to stop. Run you fools!'

      # Stop movement and hover
      client.stop()
      # Pass client to the output port immediately
      return unless @outPorts.client.isAttached()
      @outPorts.client.send client
      @outPorts.client.disconnect()

exports.getComponent = -> new Stop
