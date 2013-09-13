MovementComponent = require '../lib/MovementComponent.coffee'

class MoveForward extends MovementComponent
  constructor: ->
    super 'front', 'move forward'
exports.getComponent = -> new MoveForward
