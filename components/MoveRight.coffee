MovementComponent = require '../lib/MovementComponent.coffee'

class MoveRight extends MovementComponent
  constructor: ->
    super 'right', 'move right'
exports.getComponent = -> new MoveRight
