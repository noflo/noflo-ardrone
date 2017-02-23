MovementComponent = require '../lib/MovementComponent.coffee'

# @runtime noflo-nodejs

class MoveUp extends MovementComponent
  constructor: ->
    super 'up', 'move up'
exports.getComponent = -> new MoveUp
