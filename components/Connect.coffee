noflo = require 'noflo'
arDrone = require 'ar-drone'

# @runtime noflo-nodejs

class Connect extends noflo.Component
  description: 'Establish a connection to the AR.Drone'
  constructor: ->
    @inPorts =
      ip: new noflo.Port 'string'
      connect: new noflo.Port 'bang'
    @outPorts =
      client: new noflo.Port 'object'

    @inPorts.ip.on 'data', (data) =>
      # Prepare options
      options = {}
      if typeof data is 'string'
        options.ip = data
      @connectDrone options

    @inPorts.connect.on 'data', =>
      @connectDrone {}

  connectDrone: (options) ->
    # Connect to the drone
    client = arDrone.createClient options

    # Pass it to the output port
    return unless @outPorts.client.isAttached()
    @outPorts.client.send client
    @outPorts.client.disconnect()

exports.getComponent = -> new Connect
