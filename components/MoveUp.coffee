MovementComponent = require '../lib/MovementComponent.coffee'

class MoveUp extends MovementComponent
  constructor: ->
    super 'up', 'move up'
exports.getComponent = -> new MoveUp
