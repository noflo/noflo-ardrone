MovementComponent = require '../lib/MovementComponent.coffee'

# @runtime noflo-nodejs

class TurnClockwise extends MovementComponent
  constructor: ->
    super 'clockwise', 'turn clockwise'
exports.getComponent = -> new TurnClockwise
