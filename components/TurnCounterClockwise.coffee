MovementComponent = require '../lib/MovementComponent.coffee'

class TurnCounterClockwise extends MovementComponent
  constructor: ->
    super 'counterClockwise', 'turn counter-clockwise'
exports.getComponent = -> new TurnCounterClockwise
