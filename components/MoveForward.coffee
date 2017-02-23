MovementComponent = require '../lib/MovementComponent.coffee'

# @runtime noflo-nodejs

class MoveForward extends MovementComponent
  constructor: ->
    super 'front', 'move forward'
exports.getComponent = -> new MoveForward
