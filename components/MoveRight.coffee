MovementComponent = require '../lib/MovementComponent.coffee'

# @runtime noflo-nodejs

class MoveRight extends MovementComponent
  constructor: ->
    super 'right', 'move right'
exports.getComponent = -> new MoveRight
