MovementComponent = require '../lib/MovementComponent.coffee'

# @runtime noflo-nodejs

class MoveBackward extends MovementComponent
  constructor: ->
    super 'back', 'move backward'
exports.getComponent = -> new MoveBackward
