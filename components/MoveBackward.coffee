MovementComponent = require '../lib/MovementComponent.coffee'

class MoveBackward extends MovementComponent
  constructor: ->
    super 'back', 'move backward'
exports.getComponent = -> new MoveBackward
