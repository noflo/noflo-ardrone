MovementComponent = require '../lib/MovementComponent.coffee'

class TurnClockwise extends MovementComponent
  constructor: ->
    super 'clockwise', 'turn clockwise'
exports.getComponent = -> new TurnClockwise
