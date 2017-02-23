MovementComponent = require '../lib/MovementComponent.coffee'

# @runtime noflo-nodejs

class MoveLeft extends MovementComponent
  constructor: ->
    super 'left', 'move left'
exports.getComponent = -> new MoveLeft
