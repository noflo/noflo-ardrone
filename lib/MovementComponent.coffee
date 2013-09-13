noflo = require 'noflo'

class MovementComponent extends noflo.Component
  constructor: (movement, description) ->
    @client = null
    @speed = null

    @inPorts =
      speed: new noflo.Port 'number'
      client: new noflo.Port 'object'
    @outPorts =
      client: new noflo.Port 'object'
      error: new noflo.Port 'object'

    @inPorts.speed.on 'data', (data) =>
      @speed = data
      @move movement unless @client is null

    @inPorts.client.on 'data', (data) =>
      # Verify that the client object is a valid AR.Drone
      unless typeof data[movement] is 'function'
        err = new Error "Drone is unable to #{description}"
        if @outPorts.error.isAttached()
          @outPorts.error.send err
          @outPorts.error.disconnect()
          return
        throw err

      @client = data
      @move movement unless @speed is null

      return unless @outPorts.client.isAttached()
      @outPorts.client.send @client
      @outPorts.client.disconnect()

  move: (movement) ->
    @client[movement] @speed

module.exports = MovementComponent
