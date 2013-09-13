MovementComponent = require '../lib/MovementComponent.coffee'

class MoveLeft extends MovementComponent
  constructor: ->
    super 'left', 'move left'
exports.getComponent = -> new MoveLeft
