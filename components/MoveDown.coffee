MovementComponent = require '../lib/MovementComponent.coffee'

class MoveDown extends MovementComponent
  constructor: ->
    super 'down', 'move down'
exports.getComponent = -> new MoveDown
