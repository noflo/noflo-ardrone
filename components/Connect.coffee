noflo = require 'noflo'
arDrone = require 'ar-drone'

class Connect extends noflo.Component
  constructor: ->
    @inPorts =
      ip: new noflo.Port 'string'
    @outPorts =
      client: new noflo.Port 'object'

    @inPorts.ip.on 'data', (data) =>
      # Prepare options
      options = {}
      if typeof data is 'string'
        options.ip = data

      # Connect to the drone
      client = arDrone.createClient options

      # Pass it to the output port
      @outPorts.client.send client
      @outPorts.client.disconnect()

exports.getComponent = -> new Connect
