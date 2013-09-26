noflo = require 'noflo'

class ListenNavData extends noflo.Component
  description: 'Listens to telemetry from the AR.Drone and passes it onwards'
  constructor: ->
    @client = null
    @inPorts =
      client: new noflo.Port 'object'
    @outPorts =
      dronestate: new noflo.Port 'object'
      telemetry: new noflo.Port 'object'

    @inPorts.client.on 'data', (@client) =>
      @client.on 'navdata', @handleData

  handleData: (data) =>
    if @outPorts.dronestate.isAttached()
      @outPorts.dronestate.beginGroup data.sequenceNumber
      @outPorts.dronestate.send data.droneState
      @outPorts.dronestate.endGroup()
    if @outPorts.telemetry.isAttached()
      @outPorts.telemetry.beginGroup data.sequenceNumber
      @outPorts.telemetry.send data.demo
      @outPorts.telemetry.endGroup()

  shutdown: ->
    if @outPorts.telemetry.isAttached()
      @outPorts.telemetry.disconnect()
    if @outPorts.dronestate.isAttached()
      @outPorts.dronestate.disconnect()
    @client.removeListener 'navdata', @handleData

exports.getComponent = -> new ListenNavData
