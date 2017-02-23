MovementComponent = require '../lib/MovementComponent.coffee'

# @runtime noflo-nodejs

class TurnCounterClockwise extends MovementComponent
  constructor: ->
    super 'counterClockwise', 'turn counter-clockwise'
exports.getComponent = -> new TurnCounterClockwise
